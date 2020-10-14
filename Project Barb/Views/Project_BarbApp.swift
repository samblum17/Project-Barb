//
//  Project_BarbApp.swift
//  Project Barb
//
//  Created by Sam Blum on 10/4/20.
//

import SwiftUI

@main
struct Project_BarbApp: App {
    @State var todaysQuote: String = "\"Think Different.\""
    
    var body: some Scene {
        WindowGroup {
            ContentView(todaysQuote: $todaysQuote).onOpenURL(perform: { (url) in
                //Remove percent encoding from url to translate to quote and update content view
                todaysQuote = url.absoluteString.removingPercentEncoding ?? "Think Different."
                print(todaysQuote)
            })
        }
    }
}
