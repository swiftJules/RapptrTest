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
                Text(animationShown ? "FADE OUT" : "FADE IN")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstant.animationScreenText)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(ColorConstant.animationScreenBlue)
            .padding([.leading, .trailing, .bottom], 10)
        }
        .background(ColorConstant.animationScreenBackground)
    }
}
