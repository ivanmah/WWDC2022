//
//  NavigationModel.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 17/6/22.
//

import SwiftUI

struct NavigationModel : Identifiable, Hashable {
    
    let id = UUID()
    
    let name : String
    let viewClassName : String
    let category : Category
    
    static let preview : [NavigationModel] = [
        .init(name: "What's new in Swift", viewClassName: "WhatsNewInSwift", category: .Swift),
        .init(name: "Charts", viewClassName: "DemoChartsUIView", category: .SwiftUI),
        .init(name: "Grid", viewClassName: "GridUIView", category: .SwiftUI),
        .init(name: "Gauge", viewClassName: "GaugeUIView" , category: .SwiftUI),
        .init(name: "Multi Date Picker", viewClassName: "MultiDatePickerUIView", category: .SwiftUI),
        .init(name: "Table", viewClassName: "TableUIView", category: .SwiftUI),
        .init(name: "What's new in Xcode", viewClassName: "", category: .Xcode)
    ]
}

enum Category: Int, Hashable, CaseIterable, Identifiable, Codable {
    
    case Swift, SwiftUI, Xcode
    var id: Int {rawValue}
    
    var localizedName: LocalizedStringKey {
        switch self {
        case .Swift:
            return "Swift"
        case .SwiftUI:
            return "SwiftUI"
        case .Xcode:
            return "Xcode"
        }
    }
}

struct ViewFactory {
    
    // make function ViewBuilder
    @ViewBuilder
    func buildViewWithClassName(viewClassName: String) -> some View {
        switch viewClassName {
        case "WhatsNewInSwift":
            WhatsNewInSwift()
        case "DemoChartsUIView":
            DemoChartsUIView()
        case "GridUIView":
            GridUIView()
        case "GaugeUIView":
            GaugeUIView()
        case "MultiDatePickerUIView":
            MultiDatePickerUIView()
        case "TableUIView":
            TableUIView()
        default:
            Text("Empty View")
        }
    }
    
}
