//
//  PartyListView.swift
//  Party Explorer
//
//  Created by Marius Genton on 12/3/23.
//

import SwiftUI

struct PartyListView: View {
    
    @Binding var partyData: PartyData
    @State var searchString = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                // LazyVStack used for performance & to enable sticky section headers
                LazyVStack {
                    let liveParties = partyData.getLiveParties(searchString)
                    
                    if liveParties.count > 0 {
                        Section {
                            // Assuming no two parties have the same start date: in a real application, it would probably be better to either have a hash function to generate a unique id or assign an id to each party
                            ForEach(partyData.getLiveParties(searchString), id: \.startDate) { p in
                                PartyCard(party: p)
                            }
                        } header: { SectionTitle("Live", iconView: AnyView(
                            LottieView(filename: "LiveAnimation")
                                .frame(maxWidth: 40)
                        )) }
                    }
                    
                    Section {
                        // Assuming no two parties have the same start date: in a real application, it would probably be better to either have a hash function to generate a unique id or assign an id to each party
                        ForEach(partyData.getUpcomingParties(searchString), id: \.startDate) { p in
                            PartyCard(party: p)
                        }
                    } header: { SectionTitle("Upcoming") }
                }
                .searchable(text: $searchString) // this level of nesting makes the search bar hidden at first but can be found by dragging down
            }
            .refreshable { partyData.refresh() }
            .navigationTitle("Parties")
            .background(Color(red: 243/255, green: 244/255, blue: 245/255))
        }
    }
}

#Preview {
    TabController()
}
