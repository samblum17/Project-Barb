//
//  ContentView.swift
//  Project Barb
//
//  Created by Sam Blum on 10/4/20.
//

import SwiftUI

struct ContentView: View {
    @Binding var todaysQuote: String
    @State private var showingAlert = false
    
    private static let appGroup = "group.project-barb.shared-settings"
    @AppStorage("retroMode", store: UserDefaults(suiteName: appGroup)) var retroMode = false
    
    var body: some View {
        if (retroMode) {
            RetroMainView(todaysQuote: $todaysQuote, showingAlert: $showingAlert)
        } else {
            StandardMainView(todaysQuote: $todaysQuote, showingAlert: $showingAlert)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(todaysQuote: .constant("\"Think Different.\""))
    }
}
