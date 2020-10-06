//
//  Project_BarbWidget.swift
//  Project_BarbWidget
//
//  Created by Sam Blum on 10/6/20.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct Project_BarbWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            Color(.systemYellow).opacity(0.6)
            Text("Good morning, Sam")
                .font(.system(.title2, design: .default))
                .bold()
                .position(x: /*@START_MENU_TOKEN@*/85.0/*@END_MENU_TOKEN@*/, y: 120.0)
        }
    }
}

@main
struct Project_BarbWidget: Widget {
    let kind: String = "Project_BarbWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            Project_BarbWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Project Barb")
        .description("Project Barb will implement a simple, personalized widget to warmly greet you, right on the home screen.")
    }
}

struct Project_BarbWidget_Previews: PreviewProvider {
    static var previews: some View {
        Project_BarbWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
