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
//        .init(name: "Regular Expressions", viewClassName: "RegularExpressions", category: .Swift),
//        .init(name: "Charts", viewClassName: "DemoChartsUIView", category: .SwiftUI),
//        .init(name: "Grid", viewClassName: "DemoGridUIView", category: .SwiftUI),
//        .init(name: "Gauge", viewClassName: "GaugeUIView" , category: .SwiftUI),
//        .init(name: "Anylayout", viewClassName: "AnylayoutUIView", category: .SwiftUI),
//        .init(name: "Multi Date Picker", viewClassName: "MultiDatePickerUIView", category: .SwiftUI),
//        .init(name: "Table", viewClassName: "TableUIView", category: .SwiftUI),
//        .init(name: "BottomSheet Control", viewClassName: "BottomSheetUIView", category: .SwiftUI),
//        .init(name: "ShareLink", viewClassName: "ShareLinkUIView", category: .SwiftUI),
//        .init(name: "Searchable", viewClassName: "SearchableUIView", category: .SwiftUI),
//        .init(name: "ScrollDismissKeyboard", viewClassName: "ScrollDismissKboardUIView", category: .SwiftUI),
//        .init(name: "SF Symbols", viewClassName: "SFSymbolsUIView", category: .SwiftUI),
//        .init(name: "Navigation Stack", viewClassName: "NavigationStackUIView", category: .SwiftUI),
//        .init(name: "Navigation Split", viewClassName: "NavigationSplitUIView", category: .SwiftUI),
        .init(name: "What's new in Xcode", viewClassName: "XcodeDemoUIView", category: .Xcode),
        .init(name: "DocC", viewClassName: "DocCSwiftUIView", category: .DocC)
    ]
}

enum Category: Int, Hashable, CaseIterable, Identifiable, Codable {
    
    case Xcode, DocC, Swift, SwiftUI
    var id: Int {rawValue}
    
    var localizedName: LocalizedStringKey {
        switch self {
        case .Swift:
            return "Swift"
        case .SwiftUI:
            return "SwiftUI"
        case .Xcode:
            return "Xcode"
        case .DocC:
            return "DocC"
        }
    }
}

struct ViewFactory {
    
    // make function ViewBuilder
    @ViewBuilder
    func buildViewWithClassName(viewClassName: String, navigationPath : NavigationPath? = nil) -> some View {
        switch viewClassName {
        case "RegularExpressions":
            RegularExpressions()
        case "DemoChartsUIView":
            DemoChartsUIView()
        case "DemoGridUIView":
            DemoGridUIView()
        case "GaugeUIView":
            GaugeUIView()
        case "MultiDatePickerUIView":
            MultiDatePickerUIView()
        case "TableUIView":
            TableUIView()
        case "BottomSheetUIView":
            BottomSheetUIView()
        case "ShareLinkUIView":
            ShareLinkUIView()
        case "SearchableUIView":
            SearchableUIView()
        case "AnylayoutUIView":
            AnylayoutUIView()
        case "ScrollDismissKboardUIView":
            ScrollViewUIView()
        case "SFSymbolsUIView":
            SFSymbolsUIView()
        case "NavigationStackUIView":
            NavigationStackUIView()
        case "NavigationSplitUIView":
            NavigationSplitUIView()
        case "XcodeDemoUIView":
            XcodeDemoUIView()
        case "DocCSwiftUIView":
            DocCSwiftUIView(text: "Hello, World!!!")
        default:
            Text("Empty View")
        }
    }
}
