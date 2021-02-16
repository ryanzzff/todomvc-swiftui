//
//  TodoViewModel.swift
//  todomvc-swiftui
//
//  Created by Ryan Lee on 14/2/2021.
//

import SwiftUI

class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = [
        Todo(isCompleted: true, title: "display header and footer"),
        Todo(isCompleted: true, title: "hide list and footer if no todos"),
        Todo(isCompleted: true, title: "display counter"),
        Todo(isCompleted: true, title: "filter todo by status"),
        Todo(isCompleted: true, title: "add todo items"),
        Todo(isCompleted: true, title: "delete todo items"),
        Todo(isCompleted: false, title: "edit todo items"),
        Todo(isCompleted: false, title: "mark todo as completed"),
        Todo(isCompleted: false, title: "mark all todos as completed"),
        Todo(isCompleted: false, title: "clear completed"),
        Todo(isCompleted: false, title: "store todo persistently"),
    ]
    
    @Published var newTodo: String = ""
    
    var remainingCount: Int {
        get { return todos.filter{ !$0.isCompleted }.count }
    }
    
    func deleteTodo(at index: Int) {
        todos.remove(at: index)
    }
}

struct Todo: Identifiable {
    var id = UUID()
    var isCompleted: Bool = false
    var title: String
}

extension Todo {
    func isVisible(with filteringStatus: FilterStatus) -> Bool {
        switch filteringStatus {
        case .all: return true
        case .active: return !self.isCompleted
        case .completed: return self.isCompleted
        }
    }
}
