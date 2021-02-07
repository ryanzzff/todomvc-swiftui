//
//  View+Extensions.swift
//  todomvc-swiftui
//
//  Created by Ryan Lee on 8/2/2021.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
