//
//  DebugView.swift
//  todomvc-swiftui
//
//  Created by Ryan Lee on 7/2/2021.
//
// https://stackoverflow.com/a/64414674/3869284

import SwiftUI

struct DebugView: View {
    var body: some View {
        VStack {
                HStack {
                    Text("Light")
                        .frame(width: 75, height: 40)
                    Text("Dark")
                        .frame(width: 75, height: 40)
                }
                List(CC.colors, id: \.name) { color in
                    HStack {
                        Text(color.name)
                            .frame(width: 200, alignment: .trailing)
                        Rectangle()
                            .environment(\.colorScheme, .light)
                            .frame(width: 75, height: 40)
                            .foregroundColor(color.color)
                            .border(Color.black, width: 3)
                        Rectangle()
                            .environment(\.colorScheme, .dark)
                            .frame(width: 75, height: 40)
                            .foregroundColor(color.color)
                            .border(Color.black, width: 3)

                    }
                }
            }
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}

struct CC {
    let name: String
    let color: Color

    static var colors: [CC] { [
        CC(name: "primary", color: Color.primary),
        CC(name: "label", color: Color(UIColor.label)),
        CC(name: "lightText", color: Color(UIColor.lightText)),
        CC(name: "darkText", color: Color(UIColor.darkText)),
        CC(name: "placeholderText", color: Color(UIColor.placeholderText)),
        CC(name: "label", color: Color(UIColor.label)),
        CC(name: "secondaryLabel", color: Color(UIColor.secondaryLabel)),
        CC(name: "tertiaryLabel", color: Color(UIColor.tertiaryLabel)),
        CC(name: "quaternaryLabel", color: Color(UIColor.quaternaryLabel)),
        CC(name: "systemBackground", color: Color(UIColor.systemBackground)),
        CC(name: "secondarySystemBackground", color: Color(UIColor.secondarySystemBackground)),
        CC(name: "tertiarySystemBackground", color: Color(UIColor.tertiarySystemBackground)),
        CC(name: "systemFill", color: Color(UIColor.systemFill)),
        CC(name: "secondarySystemFill", color: Color(UIColor.secondarySystemFill)),
        CC(name: "tertiarySystemFill", color: Color(UIColor.tertiarySystemFill)),
        CC(name: "quaternarySystemFill", color: Color(UIColor.quaternarySystemFill)),
        CC(name: "systemGroupedBackground", color: Color(UIColor.systemGroupedBackground)),
        CC(name: "secondarySystemGroupedBackground", color: Color(UIColor.secondarySystemGroupedBackground)),
        CC(name: "tertiarySystemGroupedBackground", color: Color(UIColor.tertiarySystemGroupedBackground)),
        CC(name: "systemGray", color: Color(UIColor.systemGray)),
        CC(name: "systemGray2", color: Color(UIColor.systemGray2)),
        CC(name: "systemGray3", color: Color(UIColor.systemGray3)),
        CC(name: "systemGray4", color: Color(UIColor.systemGray4)),
        CC(name: "systemGray5", color: Color(UIColor.systemGray5)),
        CC(name: "systemGray6", color: Color(UIColor.systemGray6)),
        CC(name: "separator", color: Color(UIColor.separator)),
        CC(name: "opaqueSeparator", color: Color(UIColor.opaqueSeparator)),
        CC(name: "link", color: Color(UIColor.link)),
        CC(name: "systemRed", color: Color(UIColor.systemRed)),
        CC(name: "systemBlue", color: Color(UIColor.systemBlue)),
        CC(name: "systemPink", color: Color(UIColor.systemPink)),
        CC(name: "systemTeal", color: Color(UIColor.systemTeal)),
        CC(name: "systemGreen", color: Color(UIColor.systemGreen)),
        CC(name: "systemIndigo", color: Color(UIColor.systemIndigo)),
        CC(name: "systemOrange", color: Color(UIColor.systemOrange)),
        CC(name: "systemPurple", color: Color(UIColor.systemPurple)),
        CC(name: "systemYellow", color: Color(UIColor.systemYellow))]
    }
}

