//
//  DataManager.swift
//  Party Explorer
//
//  Created by Marius Genton on 11/30/23.
//

import Foundation

class DataManager {
    
    // Returns list of parties in sorted order (sorted by start time, then name)
    static func getParties() -> [Party] {
        
        // Normally, the code to fetch parties from the database would be located here. For now, the app simply generates a list of randomly generated parties
        
        // Number of parties is picked at random between 5 and 10
        let nParties = Int.random(in: 50...200)
        
        // Generation
        return (0..<nParties).map { _ in
            return self.createRandomParty()
        }.sorted { $0.startDate == $1.startDate ? $0.name > $1.name : $0.startDate > $1.startDate }
        
    }
    
    static func createRandomParty() -> Party {
        
        let startDate = Random.partyStartDate() // Must be stored temporarily to compute end date
        
        return Party(
            name: Random.partyName(),
            bannerImage: Random.partyBannerImage(),
            price: Random.partyPrice(),
            startDate: startDate,
            endDate: Random.partyEndDate(startDate)
        )
    }
    
}
