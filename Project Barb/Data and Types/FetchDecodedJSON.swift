//
//  FetchDecodedJSON.swift
//  Project Barb
//
//  Created by Sam Blum on 2/27/20.
//  Copyright © 2020 Sam Blum. All rights reserved.
//

import Foundation
import Combine

//Class for fetching data from API to load into main content view

class FetchDecodedJSON {
    
    var categories = [Category()]
    
    init() {
        loadData()
    }
    
    func loadData() {
        print ("data loaded successfully")
//Access file from bundle and pull out data
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "RawJSONData", withExtension: "json") else {return}

        guard let data = try? Data(contentsOf: url) else {return}

        let decoder = JSONDecoder()
//Decode from JSON to custom Swift types
        guard let quotesData = try? decoder.decode([NestedJSON].self, from: data) else {return}
//Store into variables for use in main content view
        let nestedIgnore = quotesData
        self.categories = nestedIgnore[0].data! //force unwrap for testing
        print(categories)
    }
}
