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

        HStack(spacing: 16) {

            // タイトル
            Text("CONTENTS")
                .font(Font.custom("KiwiMaru-Medium", size: 72))
                .padding(62)

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
        .padding(60)
    }
}

struct ContentItem: View {
    let index: Int
    let title: String

    var body: some View {
        HStack(spacing: 12) {
            Text("\(index).")
                .font(.title3.bold())
                .foregroundColor(.primary)

            Text(title)
                .font(.title3)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    SlidePreview {
        ContentSlide()
    }
}
