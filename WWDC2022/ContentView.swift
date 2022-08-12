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
    
    func isSectionNotEmpty(category: Category) -> Bool {
        return navigationModels.contains { model in
            model.category == category
        }
    }
    
    
    func getCategoryListToDisplay() -> [Category] {
        var seen: Set<Category> = []
        return navigationModels.map { model in
            model.category
        }.filter { category in
            seen.insert(category).inserted
        }
    }
    
    
        var body: some View {
            
            let display = getCategoryListToDisplay()
            
            NavigationStack(path: $router.navigationPath) {
                List(display) { category in
                    Section {
                        ForEach(navigationModels) { model in
                            if model.category == category {
                                NavigationLink(model.name, value: model)
                            }
                        }
                    } header: {
                        if self.isSectionNotEmpty(category: category) {
                            Text(category.localizedName)
                        }
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
