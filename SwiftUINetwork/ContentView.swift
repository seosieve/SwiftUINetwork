//
//  ContentView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSheetPresented = false
    @State private var isFullScreenPresented = false
    
    @State private var random = 10
    
    init() {
        print("ContentView Init")
    }
    
    @ViewBuilder
    var star: some View {
        switch random {
        case 1...30:
            Text("작은 숫자가 걸렸어요.")
        case 31...60:
            Image(systemName: "heart")
        default:
            Image(systemName: "pencil")
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                ///Push
                star
                Button("랜덤 숫자 \(random)") {
                    random = Int.random(in: 1...100)
                }
                
                NavigationLink("Navigation Push") {
                    TransitionView()
                }
                
                Button("Sheet Present") {
                    isSheetPresented = true
                }
                
                Button("FullScreen Present") {
                    isFullScreenPresented = true
                }
            }
            .fullScreenCover(isPresented: $isFullScreenPresented, content: {
                TransitionView()
            })
            .sheet(isPresented: $isSheetPresented, content: {
                TransitionView()
            })
            .padding()
            .navigationTitle("화면전환 테스트")
        }
    }
}

struct TransitionView: View {
    
    init() {
        print("TransitionView Init")
    }
    
    var body: some View {
        Text("화면 전환 테스트")
            .onAppear {
                print("Transition onAppear")
            }
            .onDisappear {
                print("Transition onDisappear")
            }
    }
}

#Preview {
    ContentView()
}

class TestViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let vc = UIHostingController(rootView: ContentView())
        present(vc, animated: true)
    }
}
