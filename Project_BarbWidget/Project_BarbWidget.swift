//
//  Project_BarbWidget.swift
//  Project_BarbWidget
//
//  Created by Sam Blum on 10/6/20.
//

import WidgetKit
import SwiftUI
import Intents

//Main widget entry point
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
            Text("Good morning, Sam")
                .font(.system(.title2, design: .default))
                .foregroundColor(.white)
                .bold()
                .position(x: /*@START_MENU_TOKEN@*/85.0/*@END_MENU_TOKEN@*/, y: 130.0)
        }.background((Image("MugBGTest"))
                        .resizable()
                        .scaledToFill()
                        .brightness(-0.25)
        )
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
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SteveEntry(date: entryDate)
            entries.append(entry)
        }
        
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
