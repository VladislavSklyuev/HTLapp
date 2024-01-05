//
//  RoomsView.swift
//  Hotel
//
//  Created by Владислав Склюев on 19.12.2023.
//

import SwiftUI

struct RoomsView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject var viewModel = RoomViewModel()
    @EnvironmentObject var hotelViewModel: HotelViewModel
    
    var body: some View {
        if viewModel.currentRoom == nil {
            ProgressView()
        } else {
            Section {
                VStack {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward").padding(.leading, 8).foregroundStyle(.black).fontWeight(.semibold)
                        }
                        Spacer()
                        Text(hotelViewModel.currentHotel.name).font(Font.custom("SF Pro Display", size: 18).weight(.medium))
                        Spacer()
                    }
                }
                .padding(.horizontal).padding(.top, 19)
            }
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(viewModel.currentRoom!.rooms) { room in
                        RoomCell(viewModel: RoomCellViewModel(position: room))
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                }.background(Color("backGray"))
            }
            .background(.white)
        }
    }
}
