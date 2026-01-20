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

    // MARK: - Phase
    enum PhaseState: Int, PhasedState, Comparable {
        static var initial: PhaseState { .set1 }

        case set1 = 1
        case set2
        case set3
        case set4

        static func < (lhs: PhaseState, rhs: PhaseState) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }

    @Phase var phase: PhaseState
    @State private var didAnimateTitle = false

    // MARK: - メッセージ（4セット）
    let messageGroups: [[String]] = [
        [
            "エンジニアたるもの、普段使っている言語で",
            "プレゼン資料を作ってみる価値があると考えた。",
            "SwiftでUIを書く延長として、スライドも表現できる点に惹かれた。"
        ],
        [
            "好きな言語（Swift）で何かを作ること自体が楽しい。",
            "スライドも自作できたら、それだけで嬉しいと感じた。"
        ],
        [
            "コードで作るからこそ、",
            "状態管理やアニメーションなど細かい表現が可能になる。",
            "UI設計そのものが学習につながる点も特徴である。"
        ],
        [
            "SlideKitはまだ情報が少なく、調べがいがある。",
            "自分の体験を含めてまとめることで、",
            "『SlideKitって実際どう便利なのか』を整理した。"
        ]
    ]

    // MARK: - 表示制御（常に2セットまで）
    func isVisible(_ index: Int) -> Bool {
        index == phase.rawValue - 1 || index == phase.rawValue - 2
    }

    // MARK: - View
    var body: some View {
        ZStack {
            Color("Deep Navy")
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 40) {

                // ===== タイトル（最初だけ横スライド → 以後固定） =====
                Text("01 研究概要")
                    .font(.custom("KiwiMaru-Medium", size: 56))
                    .foregroundColor(.white.opacity(0.85))
                    .offset(x: didAnimateTitle ? -40 : 0)
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.6)) {
                            didAnimateTitle = true
                        }
                    }
                    .padding(.bottom, 24)

                // ===== 本文（2セットずつ入れ替え） =====
                ForEach(messageGroups.indices, id: \.self) { index in
                    if isVisible(index) {
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(messageGroups[index], id: \.self) { text in
                                Text(text)
                                    .font(.custom("KiwiMaru-Medium", size: 38))
                                    .foregroundColor(.white)
                            }
                        }
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 0.4), value: phase)
                    }
                }

                Spacer()

                // 注釈（小さく）
                Text("※ 本スライドは macOS 上で作成・実行しています")
                    .font(.custom("KiwiMaru-Regular", size: 18))
                    .foregroundColor(.white.opacity(0.6))
            }
            .padding(80)
        }
    }

    // MARK: - 発表者ノート
    var script: String {
        switch phase {
        case .set1:
            return "研究の背景として、Swiftでスライドを作ろうと考えた理由を説明します。"
        case .set2:
            return "好きな言語で作ること自体の楽しさについて触れます。"
        case .set3:
            return "コードで作るからこそ可能な表現や学びについて説明します。"
        case .set4:
            return "SlideKitを使って感じた価値をまとめます。"
        }
    }
}

#Preview {
    SlidePreview {
        OverviewSlide()
    }
}
