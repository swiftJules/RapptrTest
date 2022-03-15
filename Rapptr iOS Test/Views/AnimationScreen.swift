//
//  AnimationScreen.swift
//  Rapptr iOS Test
//
//  Created by Rave Bizz on 3/15/22.
//

import SwiftUI

struct AnimationScreen: View {
    var body: some View {
        VStack {
            // display animation
            Spacer()
            Image("ic_logo")
            Spacer()
            Button {
                
            } label: {
                Text("Fade In")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(0xFFFFFF))
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(0x0E5C89))
            .padding([.leading, .trailing, .bottom], 10)
        }
        .background(Color(0xF9F9F9))
    }
}

struct AnimationScreen_Previews: PreviewProvider {
    static var previews: some View {
        AnimationScreen()
    }
}

extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}
