//
//  TitleSlide.swift
//  SlideKitAtelier
//
//  Created by 川岸遥奈 on 2025/12/02.
//

import SwiftUI
import SlideKit
@Slide
struct TitleSlide: View {
    var body: some View {
        ZStack {
            // 背景をグラデーションに
            BlueGlowGradient.gradient
                .ignoresSafeArea()

            VStack(spacing: 24) {
                // ゼミのタイトル
                HStack(alignment: .center, spacing: 40) {
                    Image("swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 320, height: 320)
                        .padding(.leading, 32)

                        Spacer()
                        Text("SlideKit を用いた\nインタラクティブ資料の設計")
                            .font(Font.custom("KiwiMaru-Medium", size: 72))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        Spacer()
                                  }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 40)
                .padding(.horizontal, 40)

                // ゼミタイトル・自分の名前
                HStack(spacing: 32) {
                    Image("swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 380, height: 350)
                    VStack(spacing: 16) {
                        Text("WEB・モバイルゼミ　最終発表")
                            .font(Font.custom("KiwiMaru-Regular", size: 56))
                            .foregroundColor(Color("Pure White"))
                        Text("IE3A 12 川岸遥奈")
                            .font(Font.custom("KiwiMaru-Regular", size: 56))
                            .foregroundColor(Color("Pure White"))

                    }

                }

            }
        }
    }
}

#Preview {
    SlidePreview {
        TitleSlide()
    }
}
