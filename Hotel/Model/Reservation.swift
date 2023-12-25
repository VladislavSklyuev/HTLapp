//
//  Reservation.swift
//  Hotel
//
//  Created by Владислав Склюев on 20.12.2023.
//

import Foundation

struct Reservation: Codable {
    var id: Int
    var hotelName: String
    var hotelAdress: String
    var horating: Int
    var ratingName: String
    var departure: String
    var arrivalCountry: String
    var tourDateStart: String
    var tourDateStop: String
    var numberOfNights: Int
    var room: String
    var nutrition: String
    var tourPrice: Int
    var fuelCharge: Int
    var serviceCharge: Int
}
