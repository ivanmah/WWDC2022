//
//  ChartsUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 27/6/22.
//

import SwiftUI
import Charts

struct Salesman : Identifiable {
    let Name : String
    let Sales : Int
    
    var id : String {Name}
}

let sales : [Salesman] = [
    .init(Name: "John", Sales: 150),
    .init(Name: "Tom", Sales: 100),
    .init(Name: "Jane", Sales: 120),
    .init(Name: "Jamie", Sales: 90),
    .init(Name: "Melissa", Sales: 60)]

struct ChartsUIView: View {
    var body: some View {
        VStack {
            Section {
                Text("Bar Chart")
                Chart {
                    ForEach(sales) { sale in
                        BarMark(x: .value("Vale", sale.Sales), y: .value("Name", sale.Name))
                    }
                }
            }
          
            Section {
                Text("Line Chart")
                Chart {
                    ForEach(sales) { sale in
                        LineMark(x: .value("Name", sale.Name), y: .value("Sales", sale.Sales))
                    }
                }
            }
            
            Section {
                Text("Area Mark")
                Chart {
                    ForEach(sales) { sale in
                        AreaMark(x: .value("Name", sale.Name), y: .value("Sales", sale.Sales))
                    }
                }
            }

        }
        
    }
}

struct ChartsUIView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsUIView()
    }
}
