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
        case finding1
        case finding2
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

                // =========================
                // 前半：導入〜公式確認
                // =========================
                if phase <= .switchToImage {
                    VStack(alignment: .leading, spacing: 12) {

                        if phase >= .initial {
                            Text("SwiftはmacOS向けの印象が強いが、公式にWindows対応が進められている。")
                        }

                        if phase >= .reason {
                            Text("Windows環境でSwiftを実際に動かし、どこまで開発可能かを検証した。")
                        }

                        ZStack {
                            if phase >= .web && phase < .switchToImage {
                                WebView(url: URL(string: "https://www.swift.org/download/")!)
                            }

                        }
                        .frame(height: 600)
                        .cornerRadius(24)
                        .shadow(radius: 20)
                    }
                    .font(.custom("KiwiMaru-Regular", size: 34))
                    .foregroundColor(.white)
                    .transition(.opacity)
                }

                // =========================
                // 後半：検証結果
                // =========================
                if phase >= .finding1 {
                    VStack(alignment: .leading, spacing: 20) {

                        VStack(alignment: .leading, spacing: 8) {
                            Text("検証して分かったこと（できたこと）")
                                .font(.custom("KiwiMaru-Medium", size: 34))

                            Text("・Swiftのコンパイル・実行が可能")
                            Text("・計算処理やロジック実装")
                            Text("・テキスト出力やCLIベースのプログラム")
                        }

                        if phase >= .finding2 {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("一方で制限も明確になった")
                                    .font(.custom("KiwiMaru-Medium", size: 34))

                                Text("・SwiftUIなどGUIを用いたアプリ開発は不可")
                                Text("・macOS/iOS向けUIフレームワークは利用できない")
                            }
                        }

                        if phase >= .conclusion {
                            Text("Swift on Windowsは学習・検証用途として有効だが、UIを伴う開発はmacOSが前提だと判断した。")
                                .font(.custom("KiwiMaru-Medium", size: 32))
                                .padding(.top, 8)
                        }
                    }
                    .font(.custom("KiwiMaru-Regular", size: 30))
                    .foregroundColor(.white.opacity(0.95))
                    .transition(.opacity)
                }

                Spacer()

                Text("※ 本スライドは macOS 上で作成・実行しています")
                    .font(.custom("KiwiMaru-Regular", size: 18))
                    .foregroundColor(.white.opacity(0.6))
            }
            .padding(80)
            .animation(.easeInOut(duration: 0.5), value: phase)
        }
    }
}

#Preview {
    SlidePreview {
        SwiftOnWindowsSlide()
    }
}
