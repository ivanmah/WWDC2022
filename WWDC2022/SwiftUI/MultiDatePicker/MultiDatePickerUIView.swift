//
//  MultiDatePickerUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 1/7/22.
//

import SwiftUI

struct MultiDatePickerUIView: View {
    @Environment(\.calendar) var calendar
    @State var dates: Set<DateComponents> = []
    
    var body: some View {
        VStack {
            MultiDatePicker("Select your preferred dates", selection: $dates, in: Date.now...)

            Text(summary)
        }
        .padding()
    }

    var summary: String {
        dates.compactMap { components in
            calendar.date(from: components)?.formatted(date: .long, time: .omitted)
        }.formatted()
    }
}

struct MultiDatePickerUIView_Previews: PreviewProvider {
    static var previews: some View {
        MultiDatePickerUIView()
    }
}
