//
//  OMDBCollectionViewCell.swift
//  OMDB
//
//  Created by Shubham Garg on 08/11/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//

import UIKit

class OMDBCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    
    var cellViewModel: OMDBCellViewModel?
    
    func setData(model: OMDBModel){
        self.titleLbl.preferredMaxLayoutWidth = UIScreen.main.bounds.size.width/2.2
        cellViewModel = OMDBCellViewModel(model: model)
        titleLbl.text = cellViewModel?.getTitle()
        typeLbl.text = cellViewModel?.getType()
        yearLbl.text = cellViewModel?.getYear()
        self.posterImageView.image = nil
        cellViewModel?.getPoster(success: { [weak self](image) in
            self?.posterImageView.image = image
        })
    }
}
