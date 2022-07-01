//
//  GridUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 30/6/22.
//

import SwiftUI

struct GridUIView: View {
    var body: some View {
        List {
            
            Section(header: Text("Grid")) {
                Grid(alignment:.bottomLeading,
                     horizontalSpacing: 1,
                     verticalSpacing: 1) {
                    GridRow {
                        Text("Row 1")
                        ForEach(0..<2) { _ in Color.red }
                    }
                    GridRow {
                        Text("Row 2")
                        ForEach(0..<5) { _ in Color.green }
                    }
                    GridRow {
                        Text("Row 3")
                        ForEach(0..<4) { _ in Color.blue }
                    }
                    GridRow {
                        Text("Row 4")
                        Color.gray.gridCellColumns(3)
                    }
                }
            }
            
            Section(header: Text("HStack")) {
                HStack(spacing: 1) {
                    ForEach(0..<8) { _  in
                        Color.brown
                    }
                }
            }
            
            Section(header: Text("VStack")) {
                VStack(spacing: 1) {
                    ForEach(0..<4) {_ in
                        Color.orange
                    }
                }
            }
            
            Section(header: Text("ZStack")) {
                ZStack {
                    Text("There are some text here that will be blocked due to ZStack")
                    Text("😁😁😁😁😁😁😁😁😁")
                }
            }
            
        }.environment(\.defaultMinListRowHeight, 300)
    }
}

struct GridUIView_Previews: PreviewProvider {
    static var previews: some View {
        GridUIView()
    }
}
