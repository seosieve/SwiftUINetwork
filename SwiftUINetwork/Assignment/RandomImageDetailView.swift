//
//  RandomImageDetailView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/5/24.
//

import SwiftUI

struct RandomImageDetailView: View {
    
    @Binding var text: String
    
    var url: URL?
    
    var body: some View {
        
        VStack(alignment: .center) {
            RandomImage(url: url)
                .frame(width: 300, height: 450)
                .offset(y: -50)
            
            TextField("입력해주세요.", text: $text)
                .padding()
                .textFieldStyle(.roundedBorder)
        }
    }
}

struct RandomImage: View {
    
    var url: URL?
    
    var body: some View {
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
