//
//  View+ext.swift
//  Rapptr iOS Test
//
//  Created by Rave Bizz on 3/24/22.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
