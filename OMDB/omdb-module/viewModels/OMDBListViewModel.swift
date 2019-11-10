//
//  OMDBListViewModel.swift
//  OMDB
//
//  Created by Shubham Garg on 08/11/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//

import Foundation

import Foundation
import SwiftUI
import Combine

protocol DataReciever {
    func onSuccess()
    func onError()
}

public class OMDBListViewModel {
    private var delegate: DataReciever?
    private var models: OMDBModels = OMDBModels()
    
    private var totalCounts = 0
    private var pageNo = 1
    
    func getModels()-> OMDBModels{
        return models
    }
    
    func getModelsCount()->Int{
        return models.count
    }
    
    func setDelegate(delegate: DataReciever){
        self.delegate = delegate
    }
    
    func getTotalCounts()->Int{
        return self.totalCounts
    }
    
    func getModelAtIndex(index: Int)-> OMDBModel{
        if index < self.getModelsCount(){
            return self.getModels()[index]
        }
        return OMDBModel()
    }
    
    func increasePageNoByOne(){
        self.pageNo += 1 
    }
    
    func load() {
        guard let url = URL(string: String(format: OMDBURL, pageNo)) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else {
                    self.delegate?.onError()
                    return
                }
                let result = try JSONDecoder().decode(OMDBSearchResult.self, from: data)
                if self.pageNo == 1 {
                    self.models = result.search ?? []
                    self.totalCounts = Int(result.totalResults ?? "0") ?? 0
                }
                else{
                    self.models.append(contentsOf: result.search ?? [])
                }
                self.delegate?.onSuccess()
            } catch {
                print("Failed To decode: ", error)
                self.delegate?.onError()
            }
        }.resume()
    }
}

