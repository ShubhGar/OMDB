//
//  AppUtils.swift
//  OMDB
//
//  Created by Shubham Garg on 08/11/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//

import Foundation


public func timeElapsedFormatter(year : String?) -> String? {
    
    if let yearString = year,let yearInt = Int(yearString){
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: Date())
        return "\(currentYear - yearInt) years ago"
    }
    
    return year
}
