//
//  PartyListView.swift
//  Party Explorer
//
//  Created by Marius Genton on 12/3/23.
//

import SwiftUI

struct PartyListView: View {
    
    @ObservedObject var partyData: PartyData
    @State var searchString = "" {
        willSet { 
            print("Updating search")
            partyData.updateSearchString(newValue)
        }
        didSet {
            print("AHHHH")
        }
    }

    var body: some View {
        NavigationStack {
            
            ZStack {
                ScrollView {
                    
                    // LazyVStack used for performance & to enable sticky section headers
                    LazyVStack {
                        if partyData.liveParties.count > 0 {
                            Section {
                                // Assuming no two parties have the same start date: in a real application, it would probably be better to either have a hash function to generate a unique id or assign an id to each party
                                ForEach(partyData.liveParties, id: \.startDate) { p in
                                    PartyCard(party: p)
                                }
                            } header: { SectionTitle("Live", iconView: AnyView(
                                LottieView(filename: "LiveAnimation")
                                    .frame(maxWidth: 40)
                            )) }
                        }
                        
                        Section {
                            // Assuming no two parties have the same start date: in a real application, it would probably be better to either have a hash function to generate a unique id or assign an id to each party
                            ForEach(partyData.upcomingParties, id: \.startDate) { p in
                                PartyCard(party: p)
                            }
                        } header: { SectionTitle("Upcoming") }
                    }
                    .searchable(text: $searchString) // this level of nesting makes the search bar hidden at first but can be found by dragging down
                    .onChange(of: searchString, {
                        partyData.updateSearchString(searchString)
                    })
                }
                .refreshable { partyData.refresh() }
                .navigationTitle("Parties")
                .background(Color(red: 243/255, green: 244/255, blue: 245/255))

                HStack {
                    Spacer()
                    
                    VStack {
                        Spacer()
                        
                        Button {
                            partyData.addParty(DataManager.createRandomParty())
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 100)
                                Image(systemName: "plus")
                                    .foregroundStyle(.white)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(15)
                            }
                            .padding()
                            .fixedSize()
                            .shadow(color: Color(white: 0.5, opacity: 0.1), radius: 5)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TabController()
}
