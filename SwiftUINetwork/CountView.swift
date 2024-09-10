//
//  CountView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/9/24.
//

import SwiftUI

struct MainCountView: View {
    
    @State private var nickname = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("닉네임을 입력해보세요.", text: $nickname)
                Image(systemName: "star")
                CountView()
            }
            .navigationTitle("카운트")
        }
    }
}

struct CountView: View {
    
    @StateObject var viewModel = CountViewModel()
    
    var body: some View {
        Text("숫자: \(viewModel.count)")
        Button(action: {
            viewModel.increaseCount()
        }, label: {
            Text("클릭")
        })
    }
}

class CountViewModel: ObservableObject {
    @Published var count = 0
    
    func increaseCount() {
        count += 1
    }
}

#Preview {
    MainCountView()
}
