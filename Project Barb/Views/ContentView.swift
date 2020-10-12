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
    
    var body: some View {
        VStack{
            Spacer()
            Text(todaysQuote)
                .font(.system(.largeTitle, design: .rounded))
                //Not actually setting to italic() below but this is a workaround to show quote in full widget view with padding and wrap around on longer quotes
                .padding()
            Text("- Steve Jobs")
                .font(.system(.title2, design: .rounded))
            Spacer()
            Spacer()
            Button(action: {
                self.showingAlert = true
            }, label: {
                Image(systemName: "info.circle")
            }).alert(isPresented:$showingAlert) {
                Alert(title: Text("Welcome to - Steve!"), message: Text("Start by adding a Quote Widget to get inspirational quotes delivered right on your home screen. The widget intelligently cycles through some of Steve's most memorable quotes to warmly greet you every week and is offered in small, medium, and large configurations. Tap into the widget to open and expand full screen. Thank you for downloading and enjoy!"), dismissButton: .default(Text("Okay")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(todaysQuote: .constant("\"Think Different.\""))
    }
}
