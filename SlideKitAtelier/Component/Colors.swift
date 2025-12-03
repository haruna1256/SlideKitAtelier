//
//  Colors.swift
//  SlideKitAtelier
//
//  Created by 川岸遥奈 on 2025/12/03.
//

import SwiftUI

// グラデーション　ネイビーから水色
struct BlueGlowGradient {
    static let gradient = LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color("Code Navy"), location: 0.0),
                .init(color: Color("Light Breeze Blue"), location: 0.7)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
}

struct BlueGlowGradientView: View {
    var body: some View {
        BlueGlowGradient.gradient
            .ignoresSafeArea()
    }
}

struct BlueGlowGradient_Previews: PreviewProvider {
    static var previews: some View {
        BlueGlowGradientView()
            .previewLayout(.fixed(width: 1920, height: 1080)) // 16:9
    }
}
