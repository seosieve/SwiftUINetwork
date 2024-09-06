//
//  RandomImageView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/4/24.
//

import SwiftUI

struct RandomImageView: View {
    
    @State var text = "Section"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 60) {
                    ForEach(0..<3) { index in
                        imageSection()
                    }
                }
                .padding(.top, 30)
            }
            .navigationTitle("My Random Image")
        }
    }
    
    func imageSection() -> some View {
        
        VStack(alignment: .leading) {
            Text(text)
                .bold()
                .font(.title)
                .padding(.horizontal, 20)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<20) { value in
                        navigationImageView(text: $text)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
    
    func navigationImageView(text: Binding<String>) -> some View {
        
        let randomNumber = Int.random(in: 1...100)
        let url = URL(string: "https://picsum.photos/100/150")
        
        return NavigationLink {
            RandomImageDetailView(text: $text, url: url)
        } label: {
            imageView(url: url)
        }
    }
    
    func imageView(url: URL?) -> some View {
        
        return AsyncImage(url: url) { value in
            switch value {
            case .empty:
                ProgressView()
            case .success(let image):
                image.clipShape(.rect(cornerRadius: 20))
            case .failure(_):
                ProgressView()
            @unknown default:
                ProgressView()
            }
        }
        .frame(width: 100, height: 150)
    }
}

#Preview {
    RandomImageView()
}
