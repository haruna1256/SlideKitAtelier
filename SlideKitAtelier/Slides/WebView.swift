//
//  WebView.swift
//  SlideKitAtelier
//
//  Created by 川岸遥奈 on 2026/01/20.
//

import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    let url: URL

    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        // 更新処理があればここ
    }
}
