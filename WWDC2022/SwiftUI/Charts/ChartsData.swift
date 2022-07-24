//
//  ChartsData.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 24/7/22.
//

import Foundation

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

struct MonthlyVolume : Identifiable {
    let Month : String
    let Volume : Int
    let EstMinVolume : Int
    let EstMaxVolume : Int
    var id : String {Month}
}

let monthlySalesData : [MonthlyVolume] = [
    .init(Month: "Jan", Volume: 120, EstMinVolume: 110, EstMaxVolume: 130),
    .init(Month: "Feb", Volume: 130, EstMinVolume: 120, EstMaxVolume: 150),
    .init(Month: "Mar", Volume: 140, EstMinVolume: 130, EstMaxVolume: 160),
    .init(Month: "Apr", Volume: 160, EstMinVolume: 140, EstMaxVolume: 180),
    .init(Month: "May", Volume: 160, EstMinVolume: 140, EstMaxVolume: 170),
    .init(Month: "Jun", Volume: 165, EstMinVolume: 150, EstMaxVolume: 170),
    .init(Month: "Jul", Volume: 170, EstMinVolume: 140, EstMaxVolume: 180),
    .init(Month: "Aug", Volume: 171, EstMinVolume: 150, EstMaxVolume: 180),
    .init(Month: "Sept", Volume: 170, EstMinVolume: 150, EstMaxVolume: 180),
    .init(Month: "Oct", Volume: 174, EstMinVolume: 140, EstMaxVolume: 190),
    .init(Month: "Nov", Volume: 180, EstMinVolume: 170, EstMaxVolume: 200),
    .init(Month: "Dec", Volume: 190, EstMinVolume: 180, EstMaxVolume: 190)
]

let totalAvgSales = 170
