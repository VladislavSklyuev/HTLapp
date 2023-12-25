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
                let room = try await NetworkService.shared.getRoom()
                DispatchQueue.main.async {
                    self.currentRoom = room
                   
                }
            } catch {
                //print(error)
            }
        }
    }
}
