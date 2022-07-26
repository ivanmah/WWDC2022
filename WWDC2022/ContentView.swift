//
//  ContentView.swift
//  WWDC2022
//
//  Created by Ivan Mah on 14/6/22.
//

import SwiftUI

final class Router: ObservableObject {
    @Published var navigationPath = NavigationPath()
}

struct ContentView: View {
    
    @State private var navigationModels : [NavigationModel] = NavigationModel.preview
    private let builder = ViewFactory()
    
    @EnvironmentObject var router : Router
    
        var body: some View {
            NavigationStack(path: $router.navigationPath) {
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
                    builder.buildViewWithClassName(viewClassName: model.viewClassName, navigationPath: router.navigationPath)
                }
                .listStyle(SidebarListStyle())
            }
            .environmentObject(self.router)
        }
}

struct ContentView_Previews: PreviewProvider {
    
    static let envObject = Router()
    
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .environmentObject(envObject)
    }
}
