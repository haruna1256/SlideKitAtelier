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
                HStack(spacing: 32) {
                    Text("研究目的")
                        .font(Font.custom("KiwiMaru-Medium", size: 90))
                        .foregroundColor(Color("Pure White"))

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
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    SlidePreview {
        ReserchSlide()
    }
}
