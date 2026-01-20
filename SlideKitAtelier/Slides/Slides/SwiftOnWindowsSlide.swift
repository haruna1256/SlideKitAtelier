//
//  SwiftOnWindowsSlide.swift
//  SlideKitAtelier
//
//  Created by 川岸遥奈 on 2026/01/20.
//

import SwiftUI
import SlideKit

@Slide
struct SwiftOnWindowsSlide: View {

    enum PhaseState: Int, PhasedState, Comparable {
        case initial
        case reason
        case web
        case switchToImage
        case conclusion

        static func < (lhs: PhaseState, rhs: PhaseState) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }

    @Phase var phase: PhaseState

    var body: some View {
        ZStack {
            Color("Deep Navy")
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 28) {

                // タイトル
                Text("03 Swift on Windows")
                    .font(.custom("KiwiMaru-Medium", size: 48))
                    .foregroundColor(.white.opacity(0.85))

                // 説明
                Group {
                    Text("SwiftはmacOS向けの印象が強いが、公式にWindows対応が進められている。")
                        .opacity(phase >= .initial ? 1 : 0)

                    if phase >= .reason {
                        Text("Windows環境でSwift + SlideKitを検証し、開発体験を確認した。")
                    }
                }
                .font(.custom("KiwiMaru-Regular", size: 34))
                .foregroundColor(.white)

                ZStack {
                    // WebView（Phase 3）
                    if phase >= .web && phase < .switchToImage {
                        WebView(url: URL(string: "https://www.swift.org/download/")!)
                            .opacity(phase >= .web && phase < .switchToImage ? 1 : 0)
                    }

                    // スクショ画像（Phase 4）
                    if phase >= .switchToImage {
                        Image("swift-on-windows")
                            .resizable()
                            .scaledToFit()
                            .transition(.opacity)
                    }
                }
                .frame(height: 420)
                .cornerRadius(24)
                .shadow(radius: 20)
                .animation(.easeInOut(duration: 0.6), value: phase)

                // まとめ
                if phase >= .conclusion {
                    Text("公式情報を実際に確認することで、Swiftはmac専用ではないと実感できた。")
                        .font(.custom("KiwiMaru-Medium", size: 32))
                        .foregroundColor(.white.opacity(0.9))
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
}

#Preview {
    SlidePreview {
        SwiftOnWindowsSlide()
    }
}
