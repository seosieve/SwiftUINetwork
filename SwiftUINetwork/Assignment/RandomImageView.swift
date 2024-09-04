//
//  RandomImageView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/4/24.
//

import SwiftUI

struct RandomImageView: View {
    
    let url = URL(string: "https://picsum.photos/100/150")
    
    var body: some View {
        NavigationView {
            ScrollView {
                imageSection()

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
                    ForEach(0..<20) { _ in
                        AsyncImage(url: url) { value in
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
            }
            
        }
    }
}

#Preview {
    RandomImageView()
}
