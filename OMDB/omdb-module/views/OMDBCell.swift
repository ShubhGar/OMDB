//
//  OMDBCell.swift
//  OMDB
//
//  Created by Shubham Garg on 07/11/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//


import SwiftUI
import Combine

struct OMDBCell : View {
    var cellViewModel: OMDBCellViewModel
    
    var body: some View {
        Group {
            ScrollView {
                VStack {
                    Image(uiImage: self.cellViewModel.getCachedImage())
                    Text(self.cellViewModel.getTitle())
                    Text(self.cellViewModel.getType())
                    Text(self.cellViewModel.getYear())
                }
                .padding()
            }
        }
        
    }
}

#if DEBUG
let model = OMDBModel()

struct OMDBCell_Previews : PreviewProvider {
    static var previews: some View {
        OMDBCell(cellViewModel: OMDBCellViewModel(model: model))
    }
}
#endif
