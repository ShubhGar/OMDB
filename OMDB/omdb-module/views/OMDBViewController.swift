//
//  OMDBViewController.swift
//  OMDB
//
//  Created by Shubham Garg on 08/11/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//

import UIKit
import SwiftUI

class OMDBViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    var viewModel: OMDBListViewModel = OMDBListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "OMDB"
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        viewModel.setDelegate(delegate: self)
        self.fetchData()
    }
    
    func fetchData(){
        viewModel.load()
    }
    
}


extension OMDBViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: self.collectionView.frame.width, height:280)
        }
        return CGSize(width: self.collectionView.frame.width/2.2, height:280)
        
    }
    
}


extension OMDBViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 1
        }
        return self.viewModel.getModelsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaginationLoaderTableViewCell.identifier, for: indexPath) as! PaginationLoaderTableViewCell
            if viewModel.getModelsCount() < viewModel.getTotalCounts(){
                cell.spinner.isHidden = false
            }
            else{
                cell.spinner.isHidden = true
            }
            cell.initialSetup()
            cell.startAnimating()
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OMDBCollectionViewCell.identifier, for: indexPath) as! OMDBCollectionViewCell
            cell.setData(model: viewModel.getModelAtIndex(index: indexPath.row))
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if viewModel.getModelsCount() < viewModel.getTotalCounts() && self.viewModel.getModelsCount() - 1 ==  indexPath.row{
            viewModel.increasePageNoByOne()
            self.fetchData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let swiftUIView = OMDBCell(cellViewModel: OMDBCellViewModel(model: viewModel.getModelAtIndex(index: indexPath.row)))
        let viewCtrl = UIHostingController(rootView: swiftUIView)
        self.navigationController?.pushViewController(viewCtrl, animated: true)
    }
    
}

extension OMDBViewController:DataReciever{
    func onSuccess() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            
        }
    }
    
    func onError() {
    }
    
    
}
