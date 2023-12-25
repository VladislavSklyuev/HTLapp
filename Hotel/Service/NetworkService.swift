//
//  NetworkService.swift
//  Hotel
//
//  Created by Владислав Склюев on 18.12.2023.
//

import SwiftUI

class NetworkService {
    @Published var image: UIImage?

    static let shared = NetworkService(); private init() {}
    
    func getHotel() async throws -> Hotel {
        let url = URL(string: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473")
        let response = try await URLSession.shared.data(from: url!)
        let data = response.0
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let hotel = try decoder.decode(Hotel.self, from: data)
        return hotel
    }
    
    func getRoom() async throws -> Room {
        let url = URL(string: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195")
    
        let response = try await URLSession.shared.data(from: url!)
        let data = response.0
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let number = try decoder.decode(Room.self, from: data)
        return number
    }
    
    func getReservation() async throws -> Reservation {
        let url = URL(string: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff")
    
        let response = try await URLSession.shared.data(from: url!)
        let data = response.0
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let reservation = try decoder.decode(Reservation.self, from: data)
        return reservation
    }
    
    func loadImage(url: [String]) async throws {
        for item in url {
            let url = URL(string: item)
            do {
                let (data, _) = try await URLSession.shared.data(from: url!)
                self.image = UIImage(data: data)
            } catch {
                //print("Error loading image: \(error)")
            }
        }
    }
}




