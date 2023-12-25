//
//  RoomCellViewModel.swift
//  Hotel
//
//  Created by Владислав Склюев on 19.12.2023.
//

import Foundation
import UIKit

class RoomCellViewModel: ObservableObject {
    @Published var position: Room.Rooms
    @Published var image = [UIImage]()
    
    init(position: Room.Rooms) {
        self.position = position
    }
    
    func loadImage() {
        self.image.removeAll()
            for i in 0..<self.position.imageUrls.count {
                guard let url = URL(string: self.position.imageUrls[i]) else { continue }

                URLSession.shared.dataTask(with: url) { data, response, error in
                    //print(response?.suggestedFilename ?? url.lastPathComponent)
                    
                    if let imgData = data, let image = UIImage(data: imgData) {
                        DispatchQueue.main.async() {
                            self.image.append(image)
                        }
                    } else if let error = error {
                        //print(error)
                    }
                }.resume()
            }
    }
}
