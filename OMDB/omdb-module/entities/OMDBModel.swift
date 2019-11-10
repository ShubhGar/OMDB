//
//  OMDBModel.swift
//  OMDB
//
//  Created by Shubham Garg on 07/11/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//

import Foundation

class OMDBModel:Codable, Identifiable{
    var title:String?
    var year:String?
    var imdbID:String?
    var type:String?
    var poster:String?
    
    init() {
        
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
    
    init(response:OMDBResponse) {
        self.title = response.title
        self.year = response.year
        self.imdbID = response.imdbID
        self.type = response.type
        self.poster = response.poster
    }
    
}

typealias OMDBModels = [OMDBModel]

