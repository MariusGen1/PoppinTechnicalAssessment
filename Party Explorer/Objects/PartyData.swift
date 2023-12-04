//
//  PartyData.swift
//  Party Explorer
//
//  Created by Marius Genton on 11/30/23.
//

import Foundation
import SwiftUI

class PartyData: ObservableObject {
    
    private var searchString: String = ""
    private var parties: [Party]
    
    @Published var liveParties = [Party]()
    @Published var upcomingParties = [Party]()
    
    
    init() {
        // Could implement this in an async manner here to load from db
        parties = DataManager.getParties()
        liveParties = getLiveParties()
        upcomingParties = getUpcomingParties()
    }
    
    func refresh() {
        liveParties = getLiveParties()
        upcomingParties = getUpcomingParties()
    }
    
    func updateSearchString(_ new: String = "") {
        searchString = new
        refresh()
    }
    
    private func searchParties() -> [Party] {
        if searchString == "" { return parties }
        else { return parties.filter { p in p.name.lowercased().contains(searchString.lowercased()) } }
    }
    
    private func getLiveParties() -> [Party] {
        return searchParties().filter { p in
            p.endDate != nil && p.startDate <= Date() && p.endDate! > Date() }
    }
    
    private func getUpcomingParties() -> [Party] {
        print("Updated list")
        return searchParties().filter { p in p.startDate > Date() }
    }
    
    func addParty(_ party: Party) {
        parties.append(party)
        parties = parties.sorted(by: { a, b in a.startDate < b.startDate })
        refresh()
    }
    
}
