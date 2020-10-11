//
//  Custom Types.swift
//  Project Barb
//
//  Created by Sam Blum on 10/11/20.
//

import Foundation

//Custom struct to ease decoding nested JSON
struct NestedJSON: Identifiable, Hashable, Codable {
    var id: Int
    var data: [Category]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case data
    }
    //decoder init
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy:
                                                    CodingKeys.self)
        self.id = try valueContainer.decode(Int.self, forKey:CodingKeys.id)
        self.data = try valueContainer.decode([Category].self, forKey:CodingKeys.data)
    }
}

//Each category corresponds to a widget size family and includes the array of quotes (strings) for that family
struct Category: Identifiable, Hashable, Codable {
    var id: Int //For identifiable protocol- remove if found unnecessary
    
    var family: String?
    var quotes: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case family = "Family"
        case quotes = "Quotes"
    }
    //default init
    init() {
        id = 0
        family = "Small/Medium"
        quotes = ["Hi, I'm Steve."]
    }
    //decoder init
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy:
                                                    CodingKeys.self)
        self.id = try valueContainer.decode(Int.self, forKey:CodingKeys.id)
        self.family = try valueContainer.decode(String.self, forKey: CodingKeys.family)
        self.quotes = try valueContainer.decode([String].self, forKey: CodingKeys.quotes)
    }
}

