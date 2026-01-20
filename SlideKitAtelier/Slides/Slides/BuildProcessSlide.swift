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

                    // macOS（メイン）
                    buildItem(
                        title: "① macOS を主軸とした構築",
                        description: "Xcode + SwiftUI + SlideKit を用いて、スライド全体を構築。デザインと動作を調整。",
                        show: phase >= .mac
                    )

                    // Windows（検証）
                    buildItem(
                        title: "② Swift on Windows（検証）",
                        description: "可能性検証として Swift toolchain を導入し、CLI ベースでの動作を確認。",
                        show: phase >= .windows
                    )

                    // SlideKit
                    buildItem(
                        title: "③ SlideKit による表現",
                        description: "Phase を活用し、タップ操作に応じた情報提示を実装。",
                        show: phase >= .slidekit
                    )

                    if phase >= .result {
                        Text("→ macOS を主軸にしつつ、他環境の可能性を把握する構成とした。")
                            .font(.custom("KiwiMaru-Medium", size: 32))
                            .foregroundColor(.white)
                            .padding(.top, 12)
                    }
                }

                Spacer()

                Text("※ Windows 環境は可能性検証として一部実施")
                    .font(.custom("KiwiMaru-Regular", size: 18))
                    .foregroundColor(.white.opacity(0.6))
            }
            .padding(80)
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
