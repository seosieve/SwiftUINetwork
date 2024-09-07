//
//  CoinTabView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/7/24.
//

import SwiftUI

struct CoinTabView: View {
    
    init() {
        ///UIKit과 똑같이 Appearance 적용
        let standardAppearance = UITabBarAppearance()
        standardAppearance.backgroundColor = .white
        standardAppearance.shadowColor = UIColor(Color.gray.opacity(0.4))
        
        UITabBar.appearance().standardAppearance = standardAppearance
        UITabBar.appearance().scrollEdgeAppearance = standardAppearance
    }
    
    var body: some View {
        TabView {
            CoinTrendingView()
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
        .tint(.green)
    }
}

#Preview {
    CoinTabView()
}
