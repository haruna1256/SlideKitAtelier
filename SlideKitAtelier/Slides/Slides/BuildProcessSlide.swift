//
//  BuildProcessSlide.swift
//  SlideKitAtelier
//
//  Created by 川岸遥奈 on 2026/01/20.
//


import SwiftUI
import SlideKit

@Slide
struct BuildProcessSlide: View {

    enum PhaseState: Int, PhasedState, Comparable {
        case initial
        case mac
        case windows
        case slidekit
        case ios
        case result

        static func < (lhs: PhaseState, rhs: PhaseState) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }

    @Phase var phase: PhaseState

    var body: some View {
        ZStack {
            Color("Deep Navy")
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 32) {

                // タイトル
                Text("04 実際の構築プロセス")
                    .font(.custom("KiwiMaru-Medium", size: 48))
                    .foregroundColor(.white.opacity(0.85))

                VStack(alignment: .leading, spacing: 24) {

                    buildItem(
                        title: "① macOS を主軸とした構築",
                        description: "Xcode + SwiftUI + SlideKit を用いて、スライド全体を構築。デザインと動作を調整。",
                        show: phase >= .mac
                    )

                    buildItem(
                        title: "② Swift on Windows（検証）",
                        description: "可能性検証として Swift toolchain を導入し、CLI ベースでの動作を確認。",
                        show: phase >= .windows
                    )

                    buildItem(
                        title: "③ SlideKit による表現設計",
                        description: "Phase を活用し、タップ操作に応じた情報提示やアニメーションを実装。",
                        show: phase >= .slidekit
                    )

                    buildItem(
                        title: "④ iOS との連携（プレゼン操作）",
                        description: "iPhone からスライドの表示切替や進行操作を行う仕組みを実装。デバイス間連携やUI設計の学習につながった。",
                        show: phase >= .ios
                    )

                    if phase >= .result {
                        Text("→ macOS を主軸としつつ、Windows・iOS 連携を含めた技術検証を行った。")
                            .font(.custom("KiwiMaru-Medium", size: 32))
                            .foregroundColor(.white)
                            .padding(.top, 12)
                            .transition(.opacity)
                    }
                }

                Spacer()

                Text("※ 本スライドは macOS 上で作成・実行しています")
                    .font(.custom("KiwiMaru-Regular", size: 18))
                    .foregroundColor(.white.opacity(0.6))
            }
            .padding(80)
            // ⭐️ これが重要
            .animation(.easeInOut(duration: 0.4), value: phase)
        }
    }

    @ViewBuilder
    func buildItem(title: String, description: String, show: Bool) -> some View {
        if show {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.custom("KiwiMaru-Medium", size: 36))
                    .foregroundColor(.white)

                Text(description)
                    .font(.custom("KiwiMaru-Regular", size: 28))
                    .foregroundColor(.white.opacity(0.9))
            }
            .transition(.opacity)
        }
    }
}

#Preview {
    SlidePreview {
        BuildProcessSlide()
    }
}
