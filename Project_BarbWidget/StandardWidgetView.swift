//
//  StandardWidgetView.swift
//  Project Barb
//
//  Created by Sam Blum on 10/12/20.
//

import Foundation
import WidgetKit
import SwiftUI

struct StandardView: View {
    var entry: SteveEntry
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    var body: some View {
        ZStack {
                Color(.systemBackground)
            if family != .systemLarge {
                Text(entry.quote)
                    .font(.system(.title2, design: .rounded))
                    //Not actually setting to italic() below but this is a workaround to show quote in full widget view with padding and wrap around on longer quotes
                    .italic()
                    .padding(.horizontal)
            } else {
                Text(entry.quote)
                    .font(.system(.title, design: .rounded))
                    //Not actually setting to italic() below but this is a workaround to show quote in full widget view with padding and wrap around on longer quotes
                    .italic()
                    .padding(.horizontal)
                
            }
        }
    }
}
