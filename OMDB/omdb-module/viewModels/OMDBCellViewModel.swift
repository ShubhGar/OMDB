//
//  OMDBCellViewModel.swift
//  OMDB
//
//  Created by Shubham Garg on 08/11/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//

import Foundation

class OMDBCellViewModel {
    var model: OMDBModel
    
    init(model: OMDBModel) {
        self.model = model
    }
    
    public func getTitle() -> String {
        return self.model.title ?? ""
    }
}
