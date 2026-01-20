//
//  SlideKitIntroSlide.swift
//  SlideKitAtelier
//
//  Created by 川岸遥奈 on 2026/01/16.
//

import SwiftUI
import SlideKit

@Slide
struct SlideKitIntroSlide: View {

    enum PhaseState: Int, PhasedState, Comparable {
        case initial, step2, step3, step4

        static func < (lhs: Self, rhs: Self) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }

    @Phase var phase: PhaseState
    @State private var didAnimateTitle = false

    let points = [
        "SlideKit は、SwiftUI を用いてスライドをコードで記述できるプレゼンテーションフレームワーク。",
        "@Slide / @SlideDeck により、1スライド＝1 View の構造を明確に定義できる。",
        "フェーズ制御（@Phase）により、箇条書きや要素を段階的に表示可能。",
        "エンジニアにとって、UI設計・状態管理・再利用性の面で親和性が高い。"
    ]

    var body: some View {
        ZStack {
            Color("Deep Navy")
                .ignoresSafeArea()

            VStack(alignment: .leading) {

                // ===== タイトル（最初だけ左→定位置、その後固定） =====
                Text("02 SlideKit とは")
                    .font(.custom("KiwiMaru-Medium", size: 48))
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.bottom, 24)
                    .offset(x: didAnimateTitle ? 0 : -40)
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.6)) {
                            didAnimateTitle = true
                        }
                    }

                // ===== 中身（フェーズで増える） =====
                ForEach(points.indices, id: \.self) { index in
                    if phase.rawValue >= index {
                        Text(points[index])
                            .font(.custom("KiwiMaru-Medium", size: 40))
                            .foregroundColor(.white)
                            .padding(.bottom, 16)
                            .transition(.opacity)
                    }
                }

                Spacer()

                // 注釈（小さく）
                Text("※ 本スライドは macOS 上で作成・実行しています")
                    .font(.custom("KiwiMaru-Regular", size: 18))
                    .foregroundColor(.white.opacity(0.6))
            }
            .padding(80)
            // ※ タイトルを動かしたいので、ここは phase の animation を残す
            .animation(.easeInOut(duration: 0.4), value: phase)
        }
    }

    // 発表者ノート
    var script: String {
        switch phase {
        case .initial:
            return "SlideKitの概要を説明します。"
        case .step2:
            return "SlideKitの基本構造についてです。"
        case .step3:
            return "フェーズ制御による特徴的な表現です。"
        case .step4:
            return "エンジニア視点での利点をまとめます。"
        }
    }
}
