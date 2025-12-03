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
                HStack(spacing: 48) {
                    Image("swift")
                        .resizable()
                        .frame(width: 320, height: 320)

                    VStack {
                        Spacer()
                        Text("SlideKit を用いたインタラクティブ資料の設計")
                            .font(.system(size: 72, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .frame(height: 220)
                }

                // ゼミタイトル・自分の名前
                HStack(spacing: 32) {
                    Image("swift")
                        .resizable()
                        .frame(width: 380, height: 350)
                    VStack(spacing: 16) {
                        Text("WEB・モバイルゼミ　最終発表")
                            .font(.system(size: 56, weight: .medium))
                            .foregroundColor(Color("Pure White"))
                        Text("IE3A 12 川岸遥奈")
                            .font(.system(size: 56, weight: .medium))
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
