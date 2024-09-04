//
//  BasicAnimationView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/2/24.
//

import SwiftUI

struct Card: Hashable, Identifiable {
    let id = UUID()
    let color = Color(hue: 1, saturation: 0, brightness: Double.random(in: 0.1...0.6))
    let name: String
}

struct BasicAnimationView: View {
    
    @State private var showAnimation = false
    
    let list = [
        Card(name: "신한카드"),
        Card(name: "우리카드"),
        Card(name: "삼성카드"),
        Card(name: "국민카드")
    ]
    
    var topTitleText: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .bold()
            .frame(maxWidth: .infinity, alignment: showAnimation ? .center : .leading)
            .overlay(alignment: .trailing, content: {
                topToggleButton
            })
            .padding()
    }
    
    var topToggleButton: some View {
        Button(action: {
            withAnimation(.bouncy) {
                showAnimation.toggle()
            }
            
        }, label: {
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .padding()
                .background(.black, in: .buttonBorder)
        })
        .rotationEffect(showAnimation ? .degrees(45) : .degrees(90))
    }
    
    var cardView: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(height: 200)
            .padding(.horizontal)
    }
    
    var body: some View {
        topTitleText
        
        Spacer()
        
        ScrollView {
            VStack(spacing: showAnimation ? -160 : 10) {
                ForEach(list, id: \.self) { item in
                    cardView.foregroundStyle(item.color)
                }
            }
        }
        
        Spacer()
        
        VStack(spacing: 10) {
            Button("Animation ON") {
                withAnimation(.bouncy) {
                    showAnimation.toggle()
                }
            }
            Button("Animation OFF") {
                showAnimation.toggle()
            }
        }
    }
}

#Preview {
    BasicAnimationView()
}
