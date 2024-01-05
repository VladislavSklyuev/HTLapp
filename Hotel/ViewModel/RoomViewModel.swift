//
//  NumberViewModel.swift
//  Hotel
//
//  Created by Владислав Склюев on 18.12.2023.
//

import Foundation
import UIKit

class RoomViewModel: ObservableObject {

    @Published var currentRoom: Room?
    
    init() {
        fetchCurrentRoom()
    }
    
    func fetchCurrentRoom() {
        Task {
            do {
                let room: Room = try await NetworkService.shared.fetchingData(url: currentURL.room.rawValue)
                DispatchQueue.main.async {
                    self.currentRoom = room
                   
                }
            } catch {
                //print(error)
            }
        }
    }
}
