//
//  HomeView.swift
//  todomvc-swiftui
//
//  Created by Ryan Lee on 7/2/2021.
//

import SwiftUI

struct HomeView: View {
        
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("todos")
                    .font(.custom("HelveticaNeue-Thin", size: 100, relativeTo: .largeTitle))
                    .foregroundColor(Color("TitleColor"))
                
                ScrollView() {
                    LazyVStack(spacing: 0) {
                        ForEach(0 ..< 15) { (index) in
                            TodoItemView()
                        }
                    }
                    .padding(0.0)
                }
                
                Spacer()
                
                VStack(spacing: 10.0) {
                    Text("Double-click to edit a todo")
                    HStack(spacing: 4.0) {
                        Text("Written by")
                        Text("Ryan Lee").bold()
                    }
                    Text("TodoMVC").bold()
                }
                .font(.custom("HelveticaNeue-Thin", size: 14, relativeTo: .footnote))
                .foregroundColor(Color.primary.opacity(0.3))
            }.frame(maxWidth: .infinity)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
            HomeView().environment(\.colorScheme, .dark)
        }
    }
}

struct TodoItemView: View {
    var body: some View {
        VStack() {
            HStack(spacing: 20.0) {
                Button(action: {
                    // TODO: button action
                }) {
                    Circle()
                        .strokeBorder(Color.primary.opacity(0.3), lineWidth: 1)
                }
                .frame(width: 40.0, height: 40.0)
                
                Text("todo item")
                    .font(.custom("HelveticaNeue-Thin", size: 28, relativeTo: .title))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(10.0)
            .overlay(Divider(), alignment: .bottom)
        }
    }
}
