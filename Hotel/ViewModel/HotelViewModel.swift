//
//  HotelViewModel.swift
//  Hotel
//
//  Created by Владислав Склюев on 18.12.2023.
//

import Foundation
import UIKit

class HotelViewModel: ObservableObject {
    @Published var image: [UIImage] = []
    @Published var currentHotel: Hotel = Hotel(id: 0, name: "", adress: "", minimalPrice: 0, priceForIt: "", rating: 0, ratingName: "", imageUrls: [], aboutTheHotel: .init(description: "", peculiarities: []))
    
    init() {
        fetchCurrentHotel()
    }
    
    func fetchCurrentHotel() {

        Task {
            do {
                let hotel: Hotel = try await NetworkService.shared.fetchingData(url: currentURL.hotel.rawValue)
                
                DispatchQueue.main.async {
                    self.currentHotel = hotel
                    self.loadImage()
                }
                
            } catch {
                //print(error)
            }
            
        }
    }
    
    func loadImage() {
        DispatchQueue.global().async {
            
            
            for i in 0..<self.currentHotel.imageUrls.count {
                guard let url = URL(string: self.currentHotel.imageUrls[i]) else { continue }
                
                let group = DispatchGroup()
                group.enter()
                URLSession.shared.dataTask(with: url) { data, response, error in
                    //print(response?.suggestedFilename ?? url.lastPathComponent)
                    
                    if let imgData = data, let image = UIImage(data: imgData) {
                        DispatchQueue.main.async() {
                            self.image.append(image)
                        }
                    } else if let error = error {
                        print(error)
                    }
                    group.leave()
                }.resume()
                group.wait()
            }
        }
    }
}
