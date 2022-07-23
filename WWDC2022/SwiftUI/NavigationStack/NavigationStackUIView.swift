//
//  NavigationStackUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 13/7/22.
//

import SwiftUI

struct NavigationStackUIView: View {
    
    @EnvironmentObject var router : Router

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            List(1..<50) { i in
                NavigationLink(value: i) {
                    Label("Row \(i)", systemImage: "\(i).circle")
                }
            }
            .navigationDestination(for: Int.self) { i in
                Text("Detail \(i)")
            }
            .navigationTitle("Navigation")
        }
    }
}

struct NavigationStackUIView_Previews: PreviewProvider {
    
    static let router = Router()
    
    static var previews: some View {
        NavigationStackUIView().environmentObject(router)
    }
}
