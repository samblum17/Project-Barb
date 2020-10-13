//
//  RetroMainView.swift
//  Project Barb
//
//  Created by Sam Blum on 10/12/20.
//

import Foundation
import SwiftUI

struct RetroMainView: View{
    @Binding var todaysQuote: String
    @Binding var showingAlert: Bool

    private static let appGroup = "group.project-barb.shared-settings"
    @AppStorage("retroMode", store: UserDefaults(suiteName: appGroup)) var retroMode = false
    
var body: some View {
    ZStack{
        Image(uiImage: UIImage(imageLiteralResourceName: "retro-mode"))
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .brightness(-0.2)
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
                Text("Retro").foregroundColor(.white)
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
