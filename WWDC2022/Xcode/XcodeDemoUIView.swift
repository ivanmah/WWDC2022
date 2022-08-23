//
//  XcodeUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 1/8/22.
//

import SwiftUI

struct FoodRating : Identifiable {
    var id = UUID()
    var name: String
    var score: Int
}

/// Demo view to showcase xcode 
struct XcodeDemoUIView: View {
    
    let foodscores: [FoodRating] = [
        FoodRating(name: "Chicken chop", score: 20),
        FoodRating(name: "Nasi Lemak", score: 25),
        FoodRating(name: "Egg Prata", score: 30)
    ]
    
    var body: some View {
        Text("Demo Xcode")
    }
}

struct XcodeDemoUIView_Previews: PreviewProvider {
    static var previews: some View {
        XcodeDemoUIView()
    }
}
