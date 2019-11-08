//
//  OMDBSearchResult.swift
//  OMDB
//
//  Created by Shubham Garg on 07/11/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//

import Foundation

class OMDBSearchResult:Codable{
    var totalResults:String?
    var response:String?
    var search:OMDBModels?
    
    enum CodingKeys: String, CodingKey {
        case totalResults = "totalResults"
        case response = "Response"
        case search = "Search"
    }
    
    init(result:OMDBResult){
        self.totalResults = result.totalResults
        self.response = result.response
        self.search = []
        if let responses = Array<Any>(result.search ?? NSSet()) as? [OMDBResponse]{
            for response in responses{
                let responseModel = OMDBModel(response: response)
                self.search?.append(responseModel)
            }
        }
        
    }
    
}
