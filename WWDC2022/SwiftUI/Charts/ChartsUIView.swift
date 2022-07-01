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

struct Region : Identifiable {
    let sales : [Salesman]
    let country : String
    
    var id : String {country}
}

let salesSG : [Salesman] = [
    .init(Name: "John", Sales: 150),
    .init(Name: "Tom", Sales: 100),
    .init(Name: "Jane", Sales: 120),
    .init(Name: "Jamie", Sales: 90),
    .init(Name: "Melissa", Sales: 60)]

let salesMY : [Salesman] = [
    .init(Name: "John", Sales: 200),
    .init(Name: "Tom", Sales: 150),
    .init(Name: "Jane", Sales: 20),
    .init(Name: "Jamie", Sales: 70),
    .init(Name: "Melissa", Sales: 10)]

let salesThai : [Salesman] = [
    .init(Name: "John", Sales: 170),
    .init(Name: "Tom", Sales: 50),
    .init(Name: "Jane", Sales: 200),
    .init(Name: "Jamie", Sales: 120),
    .init(Name: "Melissa", Sales: 30)]

let salesRegional : [Region] = [
    .init(sales: salesSG, country: "Singapore"),
    .init(sales: salesMY, country: "Malaysia"),
    .init(sales: salesThai, country: "Thailand")
]

struct ChartsUIView: View {
    var body: some View {
        VStack {
            Text("Bar Chart")
            Chart {
                ForEach(salesRegional) { region in
                    ForEach(region.sales) { salesman in
                        BarMark(x: .value("Name", salesman.Name),
                                y: .value("Sales", salesman.Sales))
                    }.foregroundStyle(by: .value("Country", region.country))
                        .position(by: .value("Country", region.country))
                }
            }
            
            Text("Line Chart")
            Chart {
                ForEach(salesRegional) { region in
                    ForEach(region.sales) { salesman in
                        LineMark(x: .value("Name", salesman.Name),
                                 y: .value("Sales", salesman.Sales))
                    }.foregroundStyle(by: .value("Country", region.country))
                        .symbol(by: .value("Country", region.country))
                        .interpolationMethod(.catmullRom)
                }
            }
            
            Text("Area Chart")
            Chart {
                ForEach(salesRegional) { region in
                    ForEach(region.sales) { salesman in
                        AreaMark(x: .value("Name", salesman.Name),
                                 y: .value("Sales", salesman.Sales))
                    }.foregroundStyle(by: .value("Country", region.country))
                }
            }
        }.navigationTitle("Charts").toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("More") {
                    MoreChartsUIView()
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
