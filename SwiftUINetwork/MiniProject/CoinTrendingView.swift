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
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<4) { _ in
                        Rectangle()
                            .frame(width: 200, height: 100)
                    }
                }
            }
            .navigationTitle("Crypto Coin")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        print("aaa")
                    }, label: {
                        ProfileImage()
                    })
                }
            }
        }
    }
}

struct ProfileImage: View {
    
    let url = URL(string: "https://picsum.photos/40/40")
    
    var body: some View {
        AsyncImage(url: url) { value in
            switch value {
            case .empty:
                ProgressView()
                    .frame(width: 40, height: 40)
            case .success(let image):
                image
            case .failure(_):
                ProgressView()
            @unknown default:
                ProgressView()
            }
        }
        .clipShape(.circle)
        .overlay(Circle().stroke(.green, lineWidth: 3))
    }
}

#Preview {
    CoinTrendingView()
}
