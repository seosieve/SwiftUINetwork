//
//  UpbitAPI.swift
//  SwiftUINetwork
//
//  Created by 서충원 on 9/3/24.
//

import Foundation

typealias Markets = [Market]

struct UpbitAPI {
    
    private init() { }

    static func fetchAllMarket() async throws -> Markets {
        
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(Markets.self, from: data)
    }
}

struct Market: Hashable, Identifiable, Codable {
    let id = UUID()
    let market: String
    let koreanName: String
    let englishName: String
    var like = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
        case like
    }
}
