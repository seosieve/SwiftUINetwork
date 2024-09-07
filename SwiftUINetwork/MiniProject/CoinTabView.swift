//
//  CoinTabView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/7/24.
//

import SwiftUI

struct CoinTabView: View {
    var body: some View {
        TabView {
            Text("The First Tab")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            Text("The Second Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            Text("The Third Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
            Text("The Fourth Tab")
                .tabItem {
                    Image(systemName: "4.square.fill")
                    Text("Fourth")
                }
        }
        .font(.headline)
    }
}

#Preview {
    CoinTabView()
}
