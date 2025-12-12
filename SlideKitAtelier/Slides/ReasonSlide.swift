//
//  ReasonSlide.swift
//  SlideKitAtelier
//
//  Created by 川岸遥奈 on 2025/12/09.
//

import SwiftUI
import SlideKit

@Slide
struct ReasonSlide: View {
    enum SlidePhasedState: Int, PhasedState, Comparable {
        case initial, step2, step3, step4

        static func < (lhs: Self, rhs: Self) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }

    @Phase var phase: SlidePhasedState

    let messages = [
        "SwitUIで作る「SlideKit」を使い、「エンジニアがコードでスライドを作るとどうなるのか？」を検証する。",
        "従来のツールと比較し、「インタラクティブな動き」や「コードによる自由度」といったSlideKitの特性を分析する。",
        "好きな言語(Swift)でスライドを作る楽しさや、コード統一による視覚的効果、操作性の向上を整理する。",
        "具体的な検証：カラー・フォントの統一効果、PowerPointとの比較メリット/デメリット、エンジニア視点での作りやすさ。"
    ]

    var body: some View {
        ZStack {
            Color("Deep Navy").ignoresSafeArea()

            VStack(alignment: .leading) {
                // タイトル (常に表示)
                Text("01 研究概要")
                    .font(.custom("KiwiMaru-Medium", size: 48))
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.bottom, 20)

                Group {
                    // Phase 1: 初期状態
                    Text(messages[safe: 0] ?? "")
                        .transition(.opacity)

                    // Phase 2: 次のタップで表示
                    if phase >= .step2 {
                        Text(messages[safe: 1] ?? "")
                            .transition(.opacity)
                    }

                    // Phase 3: さらに次のタップで表示
                    if phase >= .step3 {
                        Text(messages[safe: 2] ?? "")
                            .transition(.opacity)
                    }

                    // Phase 4: 最終タップで表示
                    if phase >= .step4 {
                        Text(messages[safe: 3] ?? "")
                            .transition(.opacity)
                    }
                }
                .font(Font.custom("KiwiMaru-Medium", size: 40))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(80)
        }
    }

    var script: String {
        switch phase {
        case .initial:
            return "研究概要の最初の段階です。"
        case .step2:
            return "2番目のポイントについて説明します。"
        case .step3:
            return "3番目のポイント、作成の楽しさと効果についてです。"
        case .step4:
            return "最後に具体的な検証項目についてです。"
        }
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

#Preview {
    SlidePreview {
        ReasonSlide()
    }
}

