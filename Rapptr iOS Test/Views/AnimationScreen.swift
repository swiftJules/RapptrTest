//
//  AnimationScreen.swift
//  Rapptr iOS Test
//
//  Created by Rave Bizz on 3/15/22.
//

import SwiftUI

struct AnimationScreen: View {
    @State private var animationShown: Bool = false
    @State private var fadeIn: Bool = false
    @State private var imageOffset: CGSize = .zero
    
    var body: some View {
        VStack {
            Spacer()
            if fadeIn {
                Image("ic_logo")
                    .resizable()
                    .scaledToFit()
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                imageOffset = gesture.translation
                            }
                            .onEnded { _ in
                                imageOffset = .zero
                            }
                    )
            }
            Spacer()
            Button {
                if !animationShown {
                    withAnimation(.easeOut(duration: 2)) {
                        self.fadeIn.toggle()
                        self.animationShown.toggle()
                    }
                } else {
                    withAnimation(.easeOut(duration: 2)) {
                        self.fadeIn = false
                        self.animationShown.toggle()
                    }
                }
            } label: {
                Text(animationShown ? "Fade Out" : "Fade In")
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
