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
            // 背景色
            Color("LightBlueBackground")
                .ignoresSafeArea()

            HStack(spacing: 0) {
                Image("swiftIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                VStack(spacing: 40) {
                    // タイトル
                    Text("SlideKit を用いたインタラクティブ資料の設計")
                        .font(.custom("TitleFont", size: 50))
                        .foregroundColor(Color("SwiftOrange"))
                        .bold()
                        .multilineTextAlignment(.center)

                    // サブタイトル・担当者
                    VStack(spacing: 10) {
                        Text("WEB・モバイルゼミ最終発表")
                            .font(.custom("SubtitleFont", size: 24))
                            .foregroundColor(Color("TextPrimary"))

                        Text("川岸遥奈")
                            .font(.custom("SubtitleFont", size: 24))
                            .foregroundColor(Color("TextPrimary"))

                        Text("日付: 発表日")
                            .font(.custom("SubtitleFont", size: 24))
                            .foregroundColor(Color("TextPrimary"))
                    }
                }
                .padding()
            }

        }
    }
}

#Preview {
    TitleSlide()
}
