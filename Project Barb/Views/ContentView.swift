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
        ZStack{
            if (retroMode) {
            Image(uiImage: UIImage(imageLiteralResourceName: "retro-mode"))
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .brightness(-0.1)
            }
            VStack{
                Spacer()
                Text(todaysQuote)
                    .font(.system(.largeTitle, design: .rounded))
                    .padding()
                    .foregroundColor(.white)
                Text("- Steve Jobs")
                    .font(.system(.title2, design: .rounded))
                    .foregroundColor(.white)
                Spacer()
                Spacer()
                HStack{
                    Text("Retro")
                    Toggle("retro", isOn: $retroMode).labelsHidden()
                    Spacer().frame(maxWidth: 70)
                    Button(action: {
                        self.showingAlert = true
                    }, label: {
                        Image(systemName: "info.circle").foregroundColor(.secondary)
                    }).alert(isPresented:$showingAlert) {
                        Alert(title: Text("Welcome to - Steve!"), message: Text("Start by adding a Quote Widget to get inspirational quotes delivered right on your home screen. The widget intelligently cycles through some of Steve Jobs' most memorable quotes to warmly greet you every week and is offered in small, medium, and large configurations. Tap into the widget to expand full screen and toggle retro mode for a slick throwback design. Thank you for downloading and enjoy!"), dismissButton: .default(Text("Close")))
                    }
                }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(todaysQuote: .constant("\"Think Different.\""))
    }
}
