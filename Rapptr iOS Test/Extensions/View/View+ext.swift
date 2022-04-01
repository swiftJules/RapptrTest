//
//  View+ext.swift
//  Rapptr iOS Test
//
//  Created by Rave Bizz on 3/24/22.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool) -> some View {
        if hidden {
            self.hidden()
        } else {
            self
        }
    }
}
