//
//  OMDBCellViewModel.swift
//  OMDB
//
//  Created by Shubham Garg on 08/11/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//

import Foundation
import UIKit
class OMDBCellViewModel {
    var model: OMDBModel
    let imageCache = CacheImage()
    
    init(model: OMDBModel) {
        self.model = model
    }
    
    public func getTitle() -> String {
        return self.model.title ?? ""
    }
    
    public func getType() -> String {
        return self.model.type ?? ""
    }
    
    public func getYear() -> String {
        return timeElapsedFormatter(year: self.model.year) ?? ""
    }
    
    public func getPoster(success: @escaping ImageSucess) {
        self.load(success: success)
    }
    
    public func getCachedImage() -> UIImage{
        if let url = self.model.poster ,let cachedImage = imageCache.getCacheImage(urlString: url) {
            return cachedImage
        }
        return UIImage(named: "omdbIcon")!
    }
    
    func load(success: @escaping ImageSucess) {
        if let url = self.model.poster ,let cachedImage = imageCache.getCacheImage(urlString: url) {
            success(cachedImage)
        } else {
            guard let urlString = self.model.poster, let url = URL(string: urlString) else { return }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, let image = UIImage(data: data) else {
                    return
                }
                DispatchQueue.main.async {
                    _ = self.imageCache.setCacheImage(urlString: urlString, imageData: data)
                    success(image)
                }
            }.resume()
        }
    }
}


typealias ImageSucess = (UIImage?)->Void
