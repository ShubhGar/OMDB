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

public class OMDBListViewModel: ObservableObject {
    public let objectWillChange = PassthroughSubject<OMDBListViewModel, Never>()
    
    var models: OMDBModels = OMDBModels() {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    func shuffle() {
        self.models = self.models.shuffled()
    }
    
    func load() {
        guard let url = URL(string: "http://www.omdbapi.com/?s=Batman&page=1&apikey=eeefc96f") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let result = try JSONDecoder().decode(OMDBSearchResult.self, from: data)
                DispatchQueue.main.async {
                    self.models = result.search ?? []
                }
            } catch {
                print("Failed To decode: ", error)
            }
            }.resume()
    }
}

