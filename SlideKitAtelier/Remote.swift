//
//  Remote.swift
//  SlideKitAtelier
//
//  Created by 川岸遥奈 on 2025/12/11.
//

import MultipeerConnectivity

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

// サービスタイプの定数化
private let serviceType = "slidekit-sync"

class Remote: NSObject, ObservableObject {
    // プラットフォームに応じたデバイス名の取得
    private static var deviceName: String {
        #if os(iOS)
        return UIDevice.current.name
        #elseif os(macOS)
        return Host.current().localizedName ?? "Mac"
        #else
        return "Unknown Device"
        #endif
    }

    private let peerID = MCPeerID(displayName: deviceName)
    // MultipeerConnectivityのセッション。
    private let session: MCSession
    private let advertiser: MCNearbyServiceAdvertiser
    private let browser: MCNearbyServiceBrowser

    // 招待済みのピアを追跡（重複招待を防ぐ）
    private var invitedPeers = Set<MCPeerID>()

    // キープアライブタイマー
    private var keepAliveTimer: Timer?

    // スライドインデックス受信時のコールバック
    var onReceiveSlideIndex: ((Int) -> Void)?

    override init() {
        // セッション初期化 (自身のpeerIDを使用)
        // 暗号化を.noneに変更して接続を試す
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .none)

        // アドバタイザーとブラウザの初期化
        advertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: serviceType)
        browser = MCNearbyServiceBrowser(peer: peerID, serviceType: serviceType)

        super.init()

        // delegateの設定
        session.delegate = self
        advertiser.delegate = self
        browser.delegate = self

        // サービスを開始
        advertiser.startAdvertisingPeer()
        browser.startBrowsingForPeers()

        // キープアライブタイマーを開始
        startKeepAlive()
    }

    // キープアライブメッセージを定期的に送信
    private func startKeepAlive() {
        keepAliveTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
            self?.sendKeepAlive()
        }
    }

    private func sendKeepAlive() {
        guard !session.connectedPeers.isEmpty,
              let data = "ping".data(using: .utf8) else {
            return
        }
        do {
            try session.send(data, toPeers: session.connectedPeers, with: .unreliable)
        } catch {
            // キープアライブの失敗は無視
        }
    }

    // 接続停止処理 (アプリ終了時などに呼ぶと良い)
    deinit {
        keepAliveTimer?.invalidate()
        advertiser.stopAdvertisingPeer()
        browser.stopBrowsingForPeers()
        session.disconnect()
    }

    // スライドインデックスを接続された全てのピアに送信
    func sendSlideIndex(_ index: Int) {

        guard !session.connectedPeers.isEmpty else {
            return
        }

        guard let data = "\(index)".data(using: .utf8) else {
            return
        }

        do {
            try session.send(data, toPeers: session.connectedPeers, with: .reliable)
        } catch {
        }
    }
}

// MARK: - Delegate Implementations
extension Remote: MCSessionDelegate, MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate {

    // MARK: MCSessionDelegate

    // 接続状態が変化したときに呼ばれる（重要）
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        DispatchQueue.main.async {
            switch state {
            case .connected:
                print("Connected: \(peerID.displayName)")
                // 接続成功したら招待リストから削除
                self.invitedPeers.remove(peerID)
            case .connecting:
                print("Connecting: \(peerID.displayName)")
            case .notConnected:
                print("Not Connected: \(peerID.displayName)")
                // 接続失敗したら招待リストから削除して再試行可能に
                self.invitedPeers.remove(peerID)
            @unknown default:
                print("Unknown state for \(peerID.displayName)")
            }
        }
    }

    // データ受信処理
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        if let string = String(data: data, encoding: .utf8) {
            // キープアライブメッセージは無視
            if string == "ping" {
                return
            }

            if let index = Int(string) {
                // UI更新はメインスレッドで行う
                DispatchQueue.main.async {
                    self.onReceiveSlideIndex?(index)
                }
            } else {
                print("Failed to parse received data: \(string)")
            }
        }
    }

    // 不要な delegate は空実装
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {}
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {}
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {}

    // MARK: MCNearbyServiceAdvertiserDelegate

    // 他のピアから招待を受けたときに呼ばれる
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        // 無条件で招待を受け入れる
        invitationHandler(true, self.session)
    }

    // MARK: MCNearbyServiceBrowserDelegate

    // 他のピアを発見したときに呼ばれる
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer otherPeerID: MCPeerID, withDiscoveryInfo: [String : String]?) {

        // 既に接続済みの場合はスキップ
        if session.connectedPeers.contains(otherPeerID) {
            return
        }

        // 接続中の場合もスキップ
        if invitedPeers.contains(otherPeerID) {
            return
        }

        // ピアID名の辞書順で比較し、小さい方だけが招待を送る（競合回避）
        // さらに、ピアIDのhash値も比較して確実に片方だけが招待するようにする
        let shouldInvite = peerID.displayName < otherPeerID.displayName ||
                          (peerID.displayName == otherPeerID.displayName && peerID.hash < otherPeerID.hash)

        if shouldInvite {
            invitedPeers.insert(otherPeerID)
            browser.invitePeer(otherPeerID, to: session, withContext: nil, timeout: 30)
        } else {
            print("Waiting for invitation from: \(otherPeerID.displayName)")
        }
    }

    // ピアが圏外になったときに呼ばれる
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("Lost peer: \(peerID.displayName)")
        invitedPeers.remove(peerID)
    }

    // エラーハンドリングの追加
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
        print("Browser failed to start: \(error.localizedDescription)")
    }

    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        print("Advertiser failed to start: \(error.localizedDescription)")
    }
}
