//
//  OverviewSlide.swift
//  SlideKitAtelier
//
//  Created by 川岸遥奈 on 2026/01/16.
//


import SwiftUI
import SlideKit

@Slide
struct OverviewSlide: View {

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
        "SwiftUIで作る「SlideKit」を用い、エンジニアがコードでスライドを作成した場合の表現可能性を検証する。",
        "従来のプレゼンテーションツールと比較し、インタラクティブ性やコードによる自由度の違いを分析する。",
        "Swiftという言語でスライドを作成する体験が、設計・表現・操作性に与える影響を整理する。",
        "具体的には、配色・フォント統一の効果や、PowerPointとのメリット・デメリットを検証する。"
    ]

    var body: some View {
        ZStack {
            Color("Deep Navy")
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 24) {

                // タイトル（常に表示）
                Text("01 研究概要")
                    .font(.custom("KiwiMaru-Medium", size: 56))
                    .foregroundColor(.white.opacity(0.85))
                    .padding(.bottom, 16)

                // フェーズで中身を表示
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
            return "本研究の概要について説明します。"
        case .point1:
            return "研究の目的について説明します。"
        case .point2:
            return "従来手法との比較観点です。"
        case .point3:
            return "Swiftで作る意義についてです。"
        case .point4:
            return "具体的な検証内容を説明します。"
        }
    }
}

#Preview {
    SlidePreview {
        OverviewSlide()
    }
}
