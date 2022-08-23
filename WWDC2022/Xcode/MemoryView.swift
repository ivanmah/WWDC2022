//
//  MemoryView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 23/8/22.
//

import SwiftUI

class User {
    var todo: Todo?
}

class Todo {
    var associatedUser: User?
}

/// Memory View
/// More readings - https://ali-akhtar.medium.com/all-about-memory-leaks-in-ios-cdd450d0cc34
struct MemoryView: View {
    
    var user: User?
    var todo: Todo?
    
    init() {
        self.user = User()
        self.todo = Todo()
        self.user?.todo = todo
        self.todo?.associatedUser = user
        self.user = nil
        self.todo = nil
    }
  
    var body: some View {
        Text("Hello World")
    }
}
