//
//  WWDC2022_Lockscreen_Widgets.swift
//  WWDC2022 Lockscreen Widgets
//
//  Created by Ivan on 18/8/22.
//

import WidgetKit
import SwiftUI
import Charts

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct WWDC2022_Lockscreen_WidgetsEntryView : View {
    @Environment(\.widgetFamily) private var widgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
        case .accessoryCircular:
            Gauge(value: 0.75) {
                Text(entry.date.formatted(.dateTime.month()))
                    .font(.body)
            }
            .gaugeStyle(.accessoryCircularCapacity)
            
        case .accessoryRectangular:
            Chart {
                ForEach(salesRegional) { region in
                    ForEach(region.sales) { salesman in
                        BarMark(x: .value("Name", salesman.Name),
                                y: .value("Sales", salesman.Sales))
                    }
                }
            }
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            
        case .accessoryInline:
            Text(entry.date, style: .relative)
            
        default:
            Text("Not implemented")
        }
    }
}

@main
struct WWDC2022_Lockscreen_Widgets: Widget {
    let kind: String = "WWDC2022_Lockscreen_Widgets"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WWDC2022_Lockscreen_WidgetsEntryView(entry: entry)
        }
        .configurationDisplayName("WWWDC2022 Lockscreen Widgets")
        .description("This is an example widget.")
        .supportedFamilies([.accessoryCircular, .accessoryRectangular, .accessoryInline])
    }
}

struct WWDC2022_Lockscreen_Widgets_Previews: PreviewProvider {
    static var previews: some View {
        WWDC2022_Lockscreen_WidgetsEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
            .previewDisplayName("Circular")
        
        WWDC2022_Lockscreen_WidgetsEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
            .previewDisplayName("Rectangular")
        
        WWDC2022_Lockscreen_WidgetsEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
            .previewDisplayName("Inline")
    }
}
