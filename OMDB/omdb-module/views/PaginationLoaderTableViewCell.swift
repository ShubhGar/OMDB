//
//  PaginationLoaderTableViewCell.swift
//  OMDB
//
//  Created by Shubham Garg on 08/11/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//

import UIKit

class PaginationLoaderTableViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - NibLoading
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initialSetup()
    }
    
    func startAnimating() {
        spinner.startAnimating()
    }
    
    // MARK: - Private
    
    func initialSetup() {
        spinner.color = .gray
    }
    
}
