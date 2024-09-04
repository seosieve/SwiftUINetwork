//
//  RandomImageView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/4/24.
//

import SwiftUI

struct RandomImageView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 60) {
                    imageSection()
                    imageSection()
                    imageSection()
                }
                .padding(.top, 30)
            }
            .navigationTitle("My Random Image")
        }
    }
    
    func imageSection() -> some View {
        VStack(alignment: .leading) {
            Text("Section 1")
                .bold()
                .font(.title)
                .padding(.horizontal, 20)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<20) { value in
                        navigationImageView()
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
    
    func navigationImageView() -> some View {
        
        let randomNumber = Int.random(in: 1...100)
        var url = URL(string: "https://picsum.photos/id/\(randomNumber)/100/150")
        
        return NavigationLink {
            RandomImageDetailView(url: url)
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
