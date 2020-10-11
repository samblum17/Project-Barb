//
//  Project_BarbWidget.swift
//  Project_BarbWidget
//
//  Created by Sam Blum on 10/6/20.
//

import WidgetKit
import SwiftUI
import Intents

//Main widget entry point, info
@main
struct Project_BarbWidget: Widget {
    let kind: String = "Project_BarbWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Project_BarbWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("- Steve Widget")
        .description("Get daily, inspirational quotes from Steve Jobs delivered straight to your home screen. Tap the widget to view a list of some of Steve's most memorable quotes.")
    }
}

//Provider type
struct SteveEntry: TimelineEntry {
    let date: Date
}

//Widget view
struct Project_BarbWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            Text("Don't let the noise of others' opinons drown out your own inner voice.")
                .font(.system(.title2, design: .default))
                .foregroundColor(Color(UIColor.label))
                .italic()
        }.background(Color(UIColor.systemBackground))
    }
}

//Timeline
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SteveEntry {
        SteveEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SteveEntry) -> ()) {
        let entry = SteveEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SteveEntry>) -> ()) {
        var entries: [SteveEntry] = []
        
        // Generate a timeline consisting of 3 entries a day apart, starting from the current date.
        let currentDate = Date()
        for secondsOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .second, value: secondsOffset, to: currentDate)!
            let entry = SteveEntry(date: entryDate)
            entries.append(entry)
        }
//FIXME- UPDATE OFFSET TO BELOW FOR PROD.
//        for dayOffset in 0 ..< 3 {
//            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
//            let entry = SteveEntry(date: entryDate)
//            entries.append(entry)
//        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}


struct Project_BarbWidget_Previews: PreviewProvider {
    static var previews: some View {
        Project_BarbWidgetEntryView(entry: SteveEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
