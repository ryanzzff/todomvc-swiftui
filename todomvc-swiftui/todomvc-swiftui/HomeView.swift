//
//  HomeView.swift
//  todomvc-swiftui
//
//  Created by Ryan Lee on 7/2/2021.
//

import SwiftUI

enum FilterStatus {
    case all
    case active
    case completed
}

struct HomeView: View {
    @ObservedObject var todoVM = TodoViewModel()
    @State var filteringStatus: FilterStatus = .all
    
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0.0) {
                Text("todos")
                    .modifier(FontModifier(style: .largeTitle))
                    .foregroundColor(Color("TitleColor"))
                
                ZStack {
                    VStack(spacing: 0.0) {
                        ScrollView() {
                            VStack(spacing: 0.0) {
                                HStack(spacing: 20.0) {
                                    Button(action: {
                                        // TODO: toggle all button action
                                    }) {
                                        Text("❯").rotationEffect(.degrees(90))
                                            .modifier(FontModifier(style: .title2))
                                    }
                                    .opacity(todoVM.todos.count > 0 ? 1 : 0)
                                    .frame(width: 40.0, height: 40.0)
                                    
                                    
                                    TextField("What needs to be done?", text: $todoVM.newTodo, onCommit: {
                                            todoVM.todos.append(Todo(title: todoVM.newTodo))
                                            todoVM.newTodo = ""
                                        })
                                        .modifier(FontModifier(style: .title, italic: todoVM.newTodo.count == 0))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(Color.primary.opacity(todoVM.newTodo.count == 0 ? 0.3 : 1))
                                        .accentColor(Color.primary)
                                }
                                .padding(10.0)
                                .foregroundColor(Color.primary.opacity(0.3))
                                .background(Color(UIColor.systemBackground))
                                .overlay(Divider(), alignment: .bottom)
                                .modifier(ShadowModifier(style: .small))
        //                        .shadow(color: Color.primary.opacity(0.15), radius: 1, x: 0, y: 2)
                                
                                ZStack {
                                    ZStack {
                                        Color(UIColor.systemBackground)
                                            .padding(.horizontal, 8)
                                            .offset(y: 8)
                                            .modifier(ShadowModifier(style: .small))
                                        
                                        Color(UIColor.systemBackground)
                                            .padding(.horizontal, 4)
                                            .offset(y: 4)
                                            .modifier(ShadowModifier(style: .small))
                                        
                                        Color(UIColor.systemBackground)
                                            .modifier(ShadowModifier(style: .small))
                                    }
                                    .isHidden(todoVM.todos.count == 0)
                                    
                                    LazyVStack(spacing: 0) {
                                        ForEach(todoVM.todos.indices, id: \.self) { index in
                                            if todoVM.todos[index].isVisible(with: filteringStatus) {
                                                TodoItemView(todo: $todoVM.todos[index])
                                            }
                                        }
                                        
                                        HStack {
                                            Text("\(todoVM.todos.filter{ !$0.isCompleted }.count) items left")
                                            Spacer()
                                            HStack {
                                                FilterButton(filterStatus: .constant(.all), filteringStatus: $filteringStatus)
                                                FilterButton(filterStatus: .constant(.active), filteringStatus: $filteringStatus)
                                                FilterButton(filterStatus: .constant(.completed), filteringStatus: $filteringStatus)
                                            }
                                            Spacer()
                                            Button(action: {
                                                // TODO: clear completed
                                            }) {
                                                Text("Clear completed")
                                            }
                                        }
                                        .isHidden(todoVM.todos.count == 0)
                                        .padding(10.0)
                                        .modifier(FontModifier(style: .footnote))
                                        .foregroundColor(Color.primary.opacity(0.7))
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
                                .modifier(FontModifier(style: .footnote))
                                .foregroundColor(Color.primary.opacity(0.3))
                                .padding(.top, 60)
                            }
                        }
                    }
                }
                .frame(maxWidth: 550)
            }.frame(maxWidth: .infinity)
            .modifier(ShadowModifier())
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
    @Binding var todo: Todo
    
    var body: some View {
        VStack() {
            HStack(spacing: 20.0) {
                Button(action: {
                    // TODO: button action
                }) {
                    if todo.isCompleted {
                        Image("toggle_on")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        Circle()
                            .strokeBorder(Color.primary.opacity(0.2), lineWidth: 1)
                    }
                }
                .frame(width: 40.0, height: 40.0)
                
                Text(todo.title)
                    .foregroundColor(todo.isCompleted ? Color.primary.opacity(0.3) : Color.primary)
                    .strikethrough(todo.isCompleted, color: Color.primary.opacity(0.3))
                    .modifier(FontModifier(style: .title))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
            }
            .padding(10.0)
            .overlay(Divider(), alignment: .bottom)
        }
    }
}

struct FilterButton: View {
    @Binding var filterStatus: FilterStatus
    @Binding var filteringStatus: FilterStatus
    
    var body: some View {
        Button(action: {
            filteringStatus = filterStatus
        }) {
            switch (self.filterStatus) {
            case .all:
                Text("All")
            case .active:
                Text("Active")
            case .completed:
                Text("Completed")
            }
        }
        .padding(.horizontal, 7)
        .padding(.vertical, 3)
        .overlay(RoundedRectangle(cornerRadius: 3, style: .continuous).stroke(filterStatus == filteringStatus ? Color("TitleColor") : Color.clear))
    }
}
