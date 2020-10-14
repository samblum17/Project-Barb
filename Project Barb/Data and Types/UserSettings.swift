//
//  UserSettings.swift
//  Project Barb
//
//  Created by Sam Blum on 10/12/20.
//

import Foundation
import Combine

//Backup user defaults access for retroMode setting
class UserSettings: ObservableObject {
    @Published var retroMode: Bool {
        didSet {
            UserDefaults.standard.set(retroMode, forKey: "retroMode")
        }
    }
    
    init() {
        self.retroMode = UserDefaults.standard.object(forKey: "retroMode") as? Bool ?? false
    }
}
