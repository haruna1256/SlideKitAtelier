//
//  ContentSlide.swift
//  SlideKitAtelier
//
//  Created by 川岸遥奈 on 2025/12/04.
//

import SwiftUI
import SlideKit

@Slide
struct ContentSlide: View {

    var body: some View {

        ZStack {
            Color("Deep Navy")
                .ignoresSafeArea()

            VStack(spacing: 0) {
                HStack(spacing: 16) {

                    Image("swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)

                    Text("SlideKit を用いたインタラクティブ資料の設計")
                        .font(Font.custom("KiwiMaru-Regular", size: 24))
                        .foregroundColor(Color("Pure White"))
                    Spacer()
                }
                .padding(.leading, 40)
                        .padding(.top, 40)

                Spacer()

                HStack(spacing: 16) {
                    // タイトル
                    Text("CONTENTS")
                        .foregroundColor(Color("Pure White"))
                        .font(Font.custom("KiwiMaru-Medium", size: 72))
                        .padding(.leading, 160)
                    Spacer()
                    // 目次一覧
                    VStack(alignment: .leading, spacing: 20) {
                        ContentItem(index: 1, title: "SlideKit とは")
                        ContentItem(index: 2, title: "なぜ SwiftUI でスライド？")
                        ContentItem(index: 3, title: "実際の構築プロセス")
                        ContentItem(index: 4, title: "Swift on Windows")
                        ContentItem(index: 5, title: "まとめ")
                    }

                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

struct ContentItem: View {
    let index: Int
    let title: String

    var body: some View {
        HStack(spacing: 12) {
            Text("\(index).")
                .font(Font.custom("KiwiMaru-Regular", size: 56))
                .foregroundColor(Color("Pure White"))

            Text(title)
                .font(Font.custom("KiwiMaru-Regular", size: 56))
                .foregroundColor(Color("Pure White"))
        }
    }
}

#Preview {
    SlidePreview {
        ContentSlide()
    }
}
