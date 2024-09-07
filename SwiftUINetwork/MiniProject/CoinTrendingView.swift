//
//  CoinTrendingView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/7/24.
//

import SwiftUI

struct CoinTrendingView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<100) { _ in
                    Text("Hello, World!")
                        .frame(maxWidth: .infinity, minHeight: 100)
                }
            }
            .navigationTitle("Crypto Coin")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        print("aaa")
                    }, label: {
                        Circle()
                    })
                }
            }
        }
    }
}

#Preview {
    CoinTrendingView()
}
