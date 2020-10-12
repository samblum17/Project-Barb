//
//  ContentView.swift
//  Project Barb
//
//  Created by Sam Blum on 10/4/20.
//

import SwiftUI

struct ContentView: View {
    @Binding var todaysQuote: String
    
    var body: some View {
        Text(todaysQuote)
            .onOpenURL(perform: { (url) in
            todaysQuote = url.relativeString
            print(todaysQuote)})
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(todaysQuote: .constant("Think Different."))
    }
}
