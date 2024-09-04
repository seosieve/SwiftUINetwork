//
//  CoinView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/3/24.
//

import SwiftUI

struct CoinView: View {
    
    @State private var market: Markets = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                bannerView
                rowView
            }
            .navigationTitle("My Money")
        }
        .task {
            guard let result = try? await UpbitAPI.fetchAllMarket() else { return }
            market = result
        }
        .onAppear {
            Task {
                guard let result = try? await UpbitAPI.fetchAllMarket() else { return }
                market = result
            }
        }
    }
    
    
    var bannerView: some View {
        ZStack {
            Rectangle()
                .fill(.green)
                .frame(height: 180)
                .overlay(alignment: .leading) {
                    bannerCircleView
                }
                .overlay(alignment: .leading) {
                    bannerTextView
                }
                .clipShape(.buttonBorder)
                .padding(.horizontal, 20)
        }
    }
    
    var bannerCircleView: some View {
        Circle()
            .fill(.white)
            .opacity(0.3)
            .scaleEffect(2)
            .offset(x: -100)
    }
    
    var bannerTextView: some View {
        VStack(alignment: .leading) {
            Text(market.first?.englishName ?? "")
                .font(.title3)
                .foregroundStyle(.white)
            Text("12,347,000원")
                .font(.title)
                .foregroundStyle(.white)
                .bold()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        .padding(30)
    }
    
    var rowView: some View {
        LazyVStack {
            ForEach($market, id: \.id) { item in
                NavigationLink {
                    NavigationLazyView(MoneyRowView(market: item))
                } label: {
                    MoneyRowView(market: item)
                }
                .buttonStyle(PlainButtonStyle()) 
            }
        }
    }
}

struct MoneyRowView: View {
    
    @Binding var market: Market
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(market.koreanName)
                    .font(.title2)
                    .bold()
                Text(market.englishName)
                    .opacity(0.8)
            }
            Spacer()
            Text(market.market)
            Button(action: {
                market.like.toggle()
            }, label: {
                Image(systemName: market.like ? "star" : "pencil")

            })
        }
//        .padding(30)
    }
}

#Preview {
    CoinView()
}
