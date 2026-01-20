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

    // 各フェーズごとに「意味のある塊」を作る
    let messages: [[String]] = [
        [
            "Swift on Windows では、可能性検証を目的として環境構築からビルドまでを実施した。",
            "公式ドキュメントやツールチェーンを調査し、macOS 以外での Swift の位置づけを理解した。",
            "結果として、実用には制約がある一方で、Swift の移植性を確認する経験となった。"
        ],
        [
            "実際のスライド開発は macOS + Xcode を中心に行った。",
            "SwiftUI と SlideKit を用い、UI設計・状態管理・アニメーションを含めた構築を行った。",
            "実務に近い環境で試行錯誤することで、設計と実装を往復する経験を積んだ。"
        ],
        [
            "SlideKit の Phase 機構を活用し、情報を段階的に提示する構成を設計した。",
            "単なる表示制御ではなく、「どの順番で伝えるか」を意識してスライドを構築した。",
            "プレゼンそのものを UI として捉える視点を得ることができた。"
        ],
        [
            "iOS と連携し、iPhone からスライドの表示切替や進行操作を行える仕組みを実装した。",
            "操作する側の UX を考慮し、直感的に扱える UI を意識して設計した。",
            "デバイス間連携を通して、状態共有や入力設計への理解が深まった。"
        ],
        [
            "本制作を通して、スライド作成を単なる資料作りではなく開発体験として捉えられた。",
            "UI設計・状態管理・拡張性を意識した構成を考える力が身についた。",
            "好きな技術を使いながら、設計力を伸ばせることを実感した。"
        ]
    ]

    var body: some View {
        ZStack {
            BlueGlowGradient.gradient
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 36) {

                // タイトル
                Text("05 まとめ")
                    .font(.custom("KiwiMaru-Medium", size: 56))
                    .foregroundColor(.white.opacity(0.85))
                    .padding(.bottom, 8)

                // フェーズごとに表示
                ForEach(messages.indices, id: \.self) { index in
                    if phase.rawValue >= index + 1 {
                        VStack(alignment: .leading, spacing: 14) {
                            ForEach(messages[index], id: \.self) { line in
                                Text(line)
                                    .font(.custom("KiwiMaru-Medium", size: 34))
                                    .foregroundColor(.white)
                            }
                        }
                        .transition(.opacity)
                    }
                }

                Spacer()

                Text("※ 本スライドは macOS 上で作成・実行しています")
                    .font(.custom("KiwiMaru-Regular", size: 18))
                    .foregroundColor(.white.opacity(0.6))
            }
            .padding(80)
            .animation(.easeInOut(duration: 0.4), value: phase)
        }
    }

    // 発表者ノート
    var script: String {
        switch phase {
        case .title:
            return "最後に、本制作全体のまとめです。"
        case .point1:
            return "Swift on Windows は技術的可能性の検証として取り組みました。"
        case .point2:
            return "実際の開発は macOS 環境で行っています。"
        case .point3:
            return "SlideKit を使った構成設計について説明します。"
        case .point4:
            return "iOS 連携と、そこから得た学びです。"
        }
    }
}

#Preview {
    SlidePreview {
        SummarySlide()
    }
}
