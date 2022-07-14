//
//  NavigationSplitUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 13/7/22.
//

import SwiftUI

struct NavigationSplitUIView: View {
    @State private var players = ["Dani", "Jamie", "Roy"]
    @State private var selectedPlayer: String?
    
    var body: some View {
        NavigationSplitView {
            List(players, id: \.self, selection: $selectedPlayer, rowContent: Text.init)
        } detail: {
            Text(selectedPlayer ?? "Please choose a player.")
        }
    }
}

struct NavigationSplitUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSplitUIView()
    }
}
