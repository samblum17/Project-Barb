//
//  Project_BarbApp.swift
//  Project Barb
//
//  Created by Sam Blum on 10/4/20.
//

import SwiftUI

@main
struct Project_BarbApp: App {
    @State var todaysQuote: String = "Not set yet!"
    
    var body: some Scene {
        WindowGroup {
            ContentView(todaysQuote: $todaysQuote).onOpenURL(perform: { (url) in
                todaysQuote = url.relativeString
                print(todaysQuote)
            })
        }
    }
}
