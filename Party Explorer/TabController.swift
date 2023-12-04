//
//  TabController.swift
//  Party Explorer
//
//  Created by Marius Genton on 11/30/23.
//

import SwiftUI

struct TabController: View {
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(Color.accentColor)
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().prefersLargeTitles = true
        
        UISearchBar.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).tintColor = .black
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor(red: 243/255, green: 244/255, blue: 245/255, alpha: 1)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white], for: .normal)

    }
    
    // Used to store app data
    @ObservedObject var partyData = PartyData()
    
    var body: some View {
        TabView {
            PartyListView(partyData: partyData)
                .tabItem { Label("Parties", systemImage: "party.popper.fill") }
        }
    }
}

#Preview {
    TabController()
}
