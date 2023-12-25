//
//  Number.swift
//  Hotel
//
//  Created by Владислав Склюев on 18.12.2023.
//

import Foundation

struct Room: Decodable {
    let rooms: [Rooms]
    
    struct Rooms: Identifiable, Decodable {
        let id: Int
        let name: String
        let price: Int
        let pricePer: String
        let peculiarities: [String]
        let imageUrls: [String]
    }
}
