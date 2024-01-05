//
//  NetworkService.swift
//  Hotel
//
//  Created by Владислав Склюев on 18.12.2023.
//

import SwiftUI

class NetworkService {
    static let shared = NetworkService(); private init() {}
    
    func fetchingData<T: Decodable>(url: String) async throws -> T {
        guard let url = URL(string: url) else { throw NetworkError.badURL }
        
        let response = try await URLSession.shared.data(from: url)
        let data = response.0
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let currentData = try decoder.decode(T.self, from: data)
        return currentData
    }
}

enum currentURL: String {
    case hotel = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
    case room = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195"
    case reservation = "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
}

enum NetworkError: Error {
    case badURL
    case badRequest
    case badResponse
    case errorDecoding
}
