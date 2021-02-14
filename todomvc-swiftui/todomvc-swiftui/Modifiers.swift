//
//  Modifiers.swift
//  todomvc-swiftui
//
//  Created by Ryan Lee on 7/2/2021.
//

import SwiftUI

struct FontModifier: ViewModifier {
    var style: Font.TextStyle
    var italic: Bool = false
    
    func body(content: Content) -> some View {
        content
            .font(.custom(italic ? "HelveticaNeue-ThinItalic" : "HelveticaNeue-Thin", size: sizeFromStyle(style: style), relativeTo: style))
    }
    
    func sizeFromStyle(style: Font.TextStyle) -> CGFloat {
        switch style {
        case .largeTitle: return 100
        case .title: return 28
        case .title2: return 22
        case .title3: return 20
        case .headline, .body: return 17
        case .callout: return 16
        case .subheadline: return 15
        case .footnote: return 13
        case .caption: return 12
        case .caption2: return 11
        @unknown default: return 14
        }        
    }
}

struct ShadowModifier: ViewModifier {
    enum Style {
        case medium
        case small
    }
    
    var style: ShadowModifier.Style = .medium
    
    @ViewBuilder func body(content: Content) -> some View {
        switch style {
        case .medium:
            content
//                .shadow(color: Color.primary.opacity(0.2), radius: 4, x: 0, y: 2)
                .shadow(color: Color.primary.opacity(0.05), radius: 24, x: 0, y: 12)
        case .small:
            content
                .shadow(color: Color.primary.opacity(0.03), radius: 1, x: 0, y: 2)
//                .shadow(color: Color.primary.opacity(0.1), radius: 2, x: 0, y: 2)
        }
    }
}
