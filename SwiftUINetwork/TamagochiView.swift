//
//  TamagochiView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/9/24.
//

import SwiftUI

struct MainTamagochiView: View {
    
    @State private var random = 0
    
    var body: some View {
        Button(action: {
            random = .random(in: 1...100)
        }, label: {
            Text("Button")
        })
    }
}

struct TamagochiView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    TamagochiView()
}
