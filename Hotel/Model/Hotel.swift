//
//  Hotel.swift
//  Hotel
//
//  Created by Владислав Склюев on 18.12.2023.
//

import Foundation

struct Hotel: Decodable, Identifiable {
    var id: Int
    var name: String
    var adress: String
    var minimalPrice: Int
    var priceForIt: String
    var rating: Int
    var ratingName: String
    var imageUrls: [String]
    var aboutTheHotel: AboutTheHotel
}

extension Hotel {
    struct AboutTheHotel: Decodable {
        var description: String
        var peculiarities: [String]
    }
}
