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
    var begins:String?
    var imdbID:String?
    var type:String?
    var movie:String?
    var poster:String?
    
    init() {
        
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case begins = "Begins"
        case imdbID = "imdbID"
        case type = "Type"
        case movie = "movie"
        case poster = "Poster"
    }
    
    init(response:OMDBResponse) {
        self.title = response.title
        self.begins = response.begins
        self.imdbID = response.imdbID
        self.type = response.type
        self.movie = response.movie
        self.poster = response.poster
    }
    
}

typealias OMDBModels = [OMDBModel]

