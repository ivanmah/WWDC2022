//
//  SearchableUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 12/7/22.
//

import SwiftUI

struct SearchableUIView: View {
    
    let fruitArray = ["Apple","Orange","Pear","Pineapple","Mango","Watermelon"]
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(SearchResult, id: \.self) { fruit in
                    NavigationLink(destination: Text("Hello " + fruit)) {
                        Text(fruit)
                    }
                }
            }
            .searchable(text: $searchText,prompt: "What are you looking for?") {
                ForEach(SearchResult, id: \.self) {
                    Text($0).searchCompletion($0)
                }
            }
            .navigationTitle("Good morning!")
        }
    }
    
    var SearchResult : [String] {
        if searchText.isEmpty {
            return fruitArray
        } else {
            return fruitArray.filter {
                $0.contains(searchText)
            }
        }
    }
}

struct SearchableUIView_Previews: PreviewProvider {
    static var previews: some View {
        SearchableUIView()
    }
}
