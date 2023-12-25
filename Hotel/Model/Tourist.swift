//
//  Tourist.swift
//  Hotel
//
//  Created by Владислав Склюев on 23.12.2023.
//

import Foundation

struct Tourist: Identifiable {
    var id = UUID()
    var showContent: Bool 
    var position: String
    var name: String
    var lastName: String
    var dateOfBirth: String
    var citizenship: String
    var passportNumber: String
    var passportDate: String
}

