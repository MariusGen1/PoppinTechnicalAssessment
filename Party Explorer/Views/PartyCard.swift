//
//  PartyCard.swift
//  Party Explorer
//
//  Created by Marius Genton on 12/3/23.
//

import SwiftUI

struct PartyCard: View {
    
    let party: Party
    
    var body: some View {
        ZStack {

            Image(party.bannerImage)
                .resizable()
                .scaledToFill()
                .aspectRatio(2, contentMode: .fit)
            
            
            VStack(alignment: .leading) {
                Spacer()
                
                Text(party.name)
                    .foregroundStyle(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                
                HStack {
                    Text(party.formattedTime())
                    
                    Spacer()
                    
                    Text("$" + String(format: "%.2f", party.price))
                }
                .foregroundStyle(.white)
                .fontWeight(.bold)
                
            }
            .padding()
            
        }
        .cornerRadius(15)
        .shadow(color: Color(white: 0.5, opacity: 0.1), radius: 5)
        .padding([.leading, .trailing])
        .padding(.bottom, 5)
        .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    ZStack {
        Color.gray
        PartyCard(party: DataManager.createRandomParty())
            .padding()
    }
}
