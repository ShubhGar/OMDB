//
//  NSObject+Extension.swift
//  OMDB
//
//  Created by Shubham Garg on 07/11/19.
//  Copyright © 2019 SHUBHAM GARG. All rights reserved.
//

import Foundation

extension NSObject{
    // get class name
   class var identifier:String{
        get{
            return String(describing: self)
        }
    }
}
