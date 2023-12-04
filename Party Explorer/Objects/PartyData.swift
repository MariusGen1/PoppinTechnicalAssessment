//
//  PartyData.swift
//  Party Explorer
//
//  Created by Marius Genton on 11/30/23.
//

import Foundation

class PartyData {
    
    private var parties: [Party]
    
    init() {
        // Could implement this in an async manner here to load from db
        parties = DataManager.getParties()
    }
    
    func refresh() {
        // Does nothing for now
    }
    
    private func searchParties(searchString: String) -> [Party] {
        if searchString == "" { return parties }
        else { return parties.filter { p in p.name.lowercased().contains(searchString.lowercased()) } }
    }
    
    func getLiveParties(_ searchString: String = "") -> [Party] {
        return searchParties(searchString: searchString).filter { p in
            p.endDate != nil && p.startDate <= Date() && p.endDate! > Date() }
    }
    
    func getUpcomingParties(_ searchString: String = "") -> [Party] {
        return searchParties(searchString: searchString).filter { p in p.startDate > Date() }
    }
    
    func addParty(_ party: Party) {
        parties.append(party)
    }
    
}
