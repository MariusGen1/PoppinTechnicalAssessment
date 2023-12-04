//
//  SectionTitle.swift
//  Party Explorer
//
//  Created by Marius Genton on 12/3/23.
//

import SwiftUI

struct SectionTitle: View {
    let title: String
    let iconView: AnyView?
    
    init(_ title: String) {
        self.title = title
        self.iconView = nil
    }
    
    init(_ title: String, iconView: AnyView) {
        self.title = title
        self.iconView = iconView
    }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.ultraThinMaterial)
                .brightness(0.0145)
            
            HStack {
                if iconView != nil { iconView }
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding([.top, .leading, .trailing])
            .padding(.bottom, 7)
        }
    }
}
