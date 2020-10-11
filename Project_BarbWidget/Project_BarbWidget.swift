//
//  Project_BarbWidget.swift
//  Project_BarbWidget
//
//  Created by Sam Blum on 10/6/20.
//

import WidgetKit
import SwiftUI
import Intents

let globalDefaultQuote = "Think Different."

//Main widget entry point, info
@main
struct Project_BarbWidget: Widget {
    let kind: String = "Project_BarbWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            QuoteView(entry: entry)
        }
        .configurationDisplayName("Quote Widget")
        .description("Get inspirational quotes from Steve Jobs delivered straight to your home screen. The widget intelligently cycles through some of Steve's most memorable quotes every few days. Tap the widget to open the app and expand today's quote.")
    }
}

//Provider type
struct SteveEntry: TimelineEntry {
    let date: Date
    let quote: String
}

//Widget view
struct QuoteView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            Text(entry.quote)
                .font(.system(.title, design: .rounded))
                .padding(.horizontal)
        }
    }
}

//Timeline
struct Provider: TimelineProvider {
    let fetcher = FetchDecodedJSON()

    func placeholder(in context: Context) -> SteveEntry {
        SteveEntry(date: Date(), quote: globalDefaultQuote)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SteveEntry) -> ()) {
        let entry = SteveEntry(date: Date(), quote: globalDefaultQuote)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SteveEntry>) -> ()) {
        var entries: [SteveEntry] = []
        let family = context.family
        let errorQuote = "Default empty quote. Error has occurred."
        var quote: String = errorQuote
        
        // Generate a timeline consisting of 3 entries a day apart, starting from the current date.
        let currentDate = Date()
        for secondsOffset in 0 ..< 5 {
            switch family {
            case .systemSmall:
                let randomQuote = fetcher.categories[0].quotes.randomElement()
                quote = randomQuote ?? errorQuote
            case .systemMedium:
                let randomQuote = fetcher.categories[0].quotes.randomElement()
                quote = randomQuote ?? errorQuote
            case .systemLarge:
                let randomQuote = fetcher.categories[1].quotes.randomElement()
                quote = randomQuote ?? errorQuote
            default:
                quote = errorQuote
            }
            
            let entryDate = Calendar.current.date(byAdding: .second, value: secondsOffset, to: currentDate)!
            let entry = SteveEntry(date: entryDate, quote: quote)
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
        Group {
            QuoteView(entry: SteveEntry(date: Date(), quote: globalDefaultQuote)).colorScheme(.dark)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            QuoteView(entry: SteveEntry(date: Date(), quote: globalDefaultQuote)).colorScheme(.light)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            QuoteView(entry: SteveEntry(date: Date(), quote: globalDefaultQuote)).colorScheme(.light)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            QuoteView(entry: SteveEntry(date: Date(), quote: globalDefaultQuote)).colorScheme(.light)
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
