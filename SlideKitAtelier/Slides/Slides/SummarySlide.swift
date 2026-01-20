//
//  SummarySlide.swift
//  SlideKitAtelier
//
//  Created by 川岸遥奈 on 2026/01/20.
//

import SwiftUI
import SlideKit

@Slide
struct SummarySlide: View {

    enum PhaseState: Int, PhasedState, Comparable {
        static var initial: PhaseState { .title }

        case title
        case point1
        case point2
        case point3
        case point4

        static func < (lhs: PhaseState, rhs: PhaseState) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }

    @Phase var phase: PhaseState

    let messages = [
        "Swift on Windowsは検証目的で環境構築・ビルドを実施し、動作を確認した。",
        "実際の開発は macOS + Xcode を中心に行い、実務に近い環境で構築した。",
        "iOSと連携し、iPhoneからスライド操作を行う仕組みを実装した。",
        "UI・UX設計やデバイス間連携を意識した設計力を身につけることができた。"
    ]

    var body: some View {
        ZStack {
            BlueGlowGradient.gradient
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 24) {

                // タイトル
                Text("05 まとめ")
                    .font(.custom("KiwiMaru-Medium", size: 56))
                    .foregroundColor(.white.opacity(0.85))
                    .padding(.bottom, 16)

                // フェーズごとに表示
                ForEach(messages.indices, id: \.self) { index in
                    if phase.rawValue >= index + 1 {
                        Text(messages[index])
                            .font(.custom("KiwiMaru-Medium", size: 40))
                            .foregroundColor(.white)
                            .transition(.opacity)
                    }
                }

                Spacer()
            }
            .padding(80)
            .animation(.easeInOut(duration: 0.4), value: phase)
        }
    }

    // 発表者ノート
    var script: String {
        switch phase {
        case .title:
            return "最後に、本研究のまとめです。"
        case .point1:
            return "Swift on Windowsは検証として取り組みました。"
        case .point2:
            return "メインの開発環境はmacOSです。"
        case .point3:
            return "iOSとの連携による操作体験を実装しました。"
        case .point4:
            return "設計視点を含めた学びが得られました。"
        }
    }
}

#Preview {
    SlidePreview {
        SummarySlide()
    }
}
