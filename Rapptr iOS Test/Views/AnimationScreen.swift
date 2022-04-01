//
//  AnimationScreen.swift
//  Rapptr iOS Test
//
//  Created by Rave Bizz on 3/15/22.
//

import SwiftUI

struct AnimationScreen: View {
    @State private var faded: Bool = false
    @State private var location: CGPoint = CGPoint(x: UIScreen.main.bounds.width/2, y: 200)

    var body: some View {
        VStack {
            Spacer()
                Image("ic_logo")
                    .resizable()
                    .scaledToFit()
                    .position(location)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                location = gesture.location
                            }
                    )
                    .isHidden(faded)
            Spacer()
            Button {
                withAnimation(.easeOut(duration: 2)) {
                    self.faded.toggle()
                }
            } label: {
                Text(faded ? "FADE IN" : "FADE OUT")
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
