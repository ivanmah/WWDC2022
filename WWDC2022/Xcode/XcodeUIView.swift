//
//  XcodeUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 1/8/22.
//

import SwiftUI
///GamePlayer is new game player 
struct GamePlayer: Identifiable , Codable {
    var id = UUID()
    var name: String
    var groupClan: String = "Winner"
    var score = 0
    
    init(id: UUID = UUID(), name: String, score: Int = 0) {
        self.id = id
        self.name = name
        self.score = min(0, score)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.score, forKey: .score)
    }
    
}


struct XcodeUIView: View {
    
    let players = [
        GamePlayer(name: "Tom"),
        GamePlayer(name: "Johnny"),
        GamePlayer(name: "Sam"),
        GamePlayer(name: "Big Boss", score: 100)
    ]
    
    var body: some View {
        
        //plural singular
        let scores = players.map { $0.score }
        let names = players.map { $0.name }
        
        
        List(players) { player in
            Text(player.name)
        }
        
        //scroll sticky
        
        //SFSymbols
        
        //Simulator
        
        //preview
        // - all sizes
        // - dark mode
        // - play
        // - pin preview
        
        //build with timing summary
        
    }
}

struct XcodeUIView_Previews: PreviewProvider {
    static var previews: some View {
        XcodeUIView()
    }
}
