//
//  OMDBList.swift
//  OMDB
//
//  Created by Shubham Garg on 07/11/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//


import Foundation
import SwiftUI

struct OMDBList : View {
    var models: OMDBModels
    
    var body: some View {
        List(self.models) { model in
            OMDBCell(cellViewModel: OMDBCellViewModel(model: model))
        }
    }
}

#if DEBUG
let models: OMDBModels = []

struct OMDBList_Previews : PreviewProvider {
    static var previews: some View {
        OMDBList(models: models)
    }
}
#endif
