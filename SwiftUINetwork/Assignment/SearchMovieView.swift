//
//  SearchMovieView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/6/24.
//

import SwiftUI

enum Genre {
    case 스릴러
    case 공포
}

struct Movie {
    let genre: Genre
    let index: Int
}

struct SearchMovieView: View {
    
    @State var text = ""
    @State var movie = Movie(genre: Genre.공포, index: 3)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movie, id: \.self) { _ in
                    NavigationLink {
                        ContentView()
                    } label: {
                        HStack {
                            Image(systemName: "person")
                            Text("awddwad")
                        }
                    }
                }
            }
            .navigationTitle("영화검색")
            .searchable(text: $text, prompt: "영화를 검색해보세요.")
            .onSubmit {
                print("sda")
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        print("aa")
                    }, label: {
                        Text("추가")
                    })
                }
            }
        }
    }
}

#Preview {
    SearchMovieView()
}
