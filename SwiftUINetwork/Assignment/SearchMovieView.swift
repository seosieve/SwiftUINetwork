//
//  SearchMovieView.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/6/24.
//

import SwiftUI

enum Genre: String, CaseIterable {
    case 스릴러
    case 공포
    case 로맨스
    case 애니메이션
    case 가족
}

struct Movie: Hashable, Identifiable {
    let id = UUID()
    let genre: Genre
    let index: Int
}

struct SearchMovieView: View {
    
    @State var text = ""
    @State var movie = [Movie(genre: Genre.공포, index: 3)]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movie, id: \.self) { movie in
                    NavigationLink {
                        ContentView()
                    } label: {
                        HStack {
                            Image(systemName: "person")
                            Text(movie.genre.rawValue)
                            Text("\(movie.index)")
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
                        let newGenre = Genre.allCases.randomElement()!
                        let newIndex = Int.random(in: 1...10)
                        let newMovie = Movie(genre: newGenre, index: newIndex)
                        movie.append(newMovie)
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
