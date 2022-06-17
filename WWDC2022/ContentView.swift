//
//  ContentView.swift
//  WWDC2022
//
//  Created by Ivan Mah on 14/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var navigationModels : [NavigationModel] = NavigationModel.preview
    private let builder = ViewFactory()
    
    var body: some View {
        NavigationStack {
            List(Category.allCases) { category in
                Section {
                    ForEach(navigationModels) { model in
                        if model.category == category {
                            NavigationLink(model.name, value: model)
                        }
                    }
                } header: {
                    Text(category.localizedName)
                }
            }
            .navigationDestination(for: NavigationModel.self) { model in
                builder.buildViewWithClassName(viewClassName: model.viewClassName) 
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
