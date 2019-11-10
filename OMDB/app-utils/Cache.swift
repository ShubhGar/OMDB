//
//  Cache.swift
//  OMDB
//
//  Created by Shubham Garg on 10/11/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//

import UIKit

class CacheImage: NSObject {
    
    
    func setCacheImage(urlString: String, imageData: Data)-> Bool{
        var cachedImageCount = UserDefaults.standard.integer(forKey: "CachedImageCount")
        cachedImageCount += 1
        UserDefaults.standard.set(cachedImageCount, forKey: "CachedImageCount")
        let imageName = "image\(cachedImageCount).jpg"
        let saved = self.saveImageToDirectory(imageName: imageName, imageData: imageData)
        if saved{
            UserDefaults.standard.setValue(imageName, forKey: urlString)
        }
        
        return saved
    }
    
    private func saveImageToDirectory(imageName: String, imageData: Data) -> Bool{
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let fileURL = documentDirectory.appendingPathComponent(imageName)
            try imageData.write(to: fileURL)
            return true
        } catch {
            print(error)
        }
        return false
    }
    
    func getCacheImage(urlString: String)-> UIImage?{
        if let imageName = UserDefaults.standard.string(forKey: urlString){
            do {
                let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
                let fileURL = documentDirectory.appendingPathComponent(imageName)
                return UIImage(contentsOfFile: fileURL.path)
            } catch {
                print(error)
            }
        }
        return nil
    }
    
}
