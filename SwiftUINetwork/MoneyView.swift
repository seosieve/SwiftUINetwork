//
//  MoneyView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/3/24.
//

import SwiftUI

struct MoneyView: View {
    
    @State private var money = dummy
    @State private var banner = Banner()
    
    var body: some View {
        NavigationView {
            ScrollView {
                scrollBannerView
                rowView
            }
            .refreshable {
                money = dummy.shuffled()
                banner = Banner()
            }
            .navigationTitle("My Money")
        }
        .onAppear {
            money = dummy.shuffled()
            banner = Banner()
        }
    }
    
    var scrollBannerView: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<5) { _ in
                    bannerView.containerRelativeFrame(.horizontal)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.hidden)
    }
    
    var bannerView: some View {
        ZStack {
            Rectangle()
                .fill(banner.color)
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
            Text("나의 소비내역")
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
            ForEach(money, id: \.id) { item in
                rowItemView(money: item)
            }
        }
    }
    
    func rowItemView(money: Money) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(money.product)
                    .font(.title2)
                    .bold()
                Text(money.category.rawValue)
                    .opacity(0.8)
            }
            Spacer()
            Text("\(money.amount)")
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 10)
    }
}

#Preview {
    MoneyView()
}
