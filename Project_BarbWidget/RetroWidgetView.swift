//
//  RetroWidgetView.swift
//  Project Barb
//
//  Created by Sam Blum on 10/12/20.
//

import Foundation
import WidgetKit
import SwiftUI

struct RetroView: View {
    var entry: SteveEntry
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    var body: some View {
        
        ZStack {
            Image(uiImage: UIImage(imageLiteralResourceName: "retro-mode"))
                .resizable()
                .brightness(-0.20)
            if family != .systemLarge {
                Text(entry.quote)
                    .font(.system(.title2, design: .rounded))
                    //Not actually setting to italic() below but this is a workaround to show quote in full widget view with padding and wrap around on longer quotes
                    .italic()
                    .padding(.horizontal)
                    .foregroundColor(.white)
            } else {
                Text(entry.quote)
                    .font(.system(.title, design: .rounded))
                    //Not actually setting to italic() below but this is a workaround to show quote in full widget view with padding and wrap around on longer quotes
                    .italic()
                    .padding(.horizontal)
                    .foregroundColor(.white)
                
            }
        }
    }
    
}
