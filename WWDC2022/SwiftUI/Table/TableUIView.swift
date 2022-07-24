//
//  TableUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 6/7/22.
//

import SwiftUI

struct TableUIView: View {
    
    struct User: Identifiable {
        let id: Int
        var name: String
        var score: Int
        var song: String
    }
    
    @State private var users = [
        User(id: 1, name: "Taylor Swift", score: 95, song: "Love Story"),
        User(id: 2, name: "Justin Bieber", score: 70, song: "Baby"),
        User(id: 3, name: "Adele", score: 90, song: "Hello"),
        User(id: 4, name: "Lady Gaga", score: 80, song: "Pocker Face"),
        User(id: 5, name: "Katy Perry", score: 85, song: "Teenage Dream"),
        User(id: 6, name: "Eninem", score: 75, song: "Not Afraid")
    ]
    
    @State private var sortOrder = [KeyPathComparator(\User.name)]
    @State private var selection = Set<User.ID>()

     var body: some View {
         Table(users, selection: $selection, sortOrder: $sortOrder) {
             TableColumn("Name", value: \.name)
             TableColumn("Song", value: \.song)
             TableColumn("Score", value: \.score) { user in
                 Text(String(user.score))
             }
         }
         .onChange(of: sortOrder) { newOrder in
             users.sort(using: newOrder)
         }
         Text("\(selection.count) people selected")
     }
}

struct TableUIView_Previews: PreviewProvider {
    static var previews: some View {
        TableUIView()
    }
}
