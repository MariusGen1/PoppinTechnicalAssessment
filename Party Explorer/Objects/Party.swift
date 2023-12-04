//
//  Party.swift
//  Party Explorer
//
//  Created by Marius Genton on 11/30/23.
//

import Foundation

struct Party {
    let name: String
    let bannerImage: String // This could also be a URL, but for the purpose of this is assessment it makes more sense to have it be a string (we're accessing local files)
    let price: Double
    let startDate: Date
    let endDate: Date?
    
    func formattedTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd h:mma"
        
        let startString = dateFormatter.string(from: startDate)
        
        if endDate == nil { return startString }
        
        dateFormatter.dateFormat = "h:mma"
        
        let endString = dateFormatter.string(from: endDate!)
        
        return startString + "-" + endString
    }
}
