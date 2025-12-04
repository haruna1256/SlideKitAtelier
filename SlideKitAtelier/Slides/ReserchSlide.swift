//
//  ReserchSlide.swift
//  SlideKitAtelier
//
//  Created by 川岸遥奈 on 2025/12/04.
//

import SwiftUI
import SlideKit

@Slide
struct ReserchSlide: View {
    var body: some View {
        ZStack {
            // 背景をグラデーションに
            BlueGlowGradient.gradient
                .ignoresSafeArea()
            HStack(alignment: .center, spacing: 32) {
                Text("研究目的")
                    .font(Font.custom("KiwiMaru-Medium", size: 90))
                    .foregroundColor(Color("Pure White"))
                    .padding(.leading, 160)


                HStack(spacing: 16) {
                    Image("swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    Image("swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    Image("swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                .padding(.leading, 100)
            }
            .padding(60)
        }
    }
}

#Preview {
    SlidePreview {
        ReserchSlide()
    }
}
