//
//  RoomCell.swift
//  Hotel
//
//  Created by Владислав Склюев on 19.12.2023.
//

import SwiftUI

struct RoomCell: View {
    @StateObject var viewModel: RoomCellViewModel
    @State private var showReservation = false
    @State private var selectedIndex = 0
    
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                RectangleView(images: $viewModel.image)
                
                Text(viewModel.position.name).font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                
                TagCloudView(tags: viewModel.position.peculiarities)

                Button {
                    
                } label: {
                    HStack(spacing: 6) {
                        Text("Подробнее о номере").font(Font.custom("SF Pro Display", size: 16).weight(.medium)).foregroundStyle(Color("blue1"))
                        Image(systemName: "chevron.forward").bold()
                    }.padding(.leading, 12).padding(.trailing, 10).frame(height: 35).background(Color("blue1").opacity(0.1)).cornerRadius(5)
                }
                
                HStack(alignment: .bottom) {
                    Text("\(String(viewModel.position.price.formatted()))₽")
                        .font(Font.custom("SF Pro Display", size: 30).weight(.semibold))
                    Text(viewModel.position.pricePer)
                        .padding(.bottom, 3)
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundStyle(Color("gray1"))
                }.padding(.vertical, 8)
                
                Button {
                    showReservation.toggle()
                } label: {
                    Text("Выбрать номер").font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(12)
                }
            }.padding()

        }.background(.white)
            .padding(.top, 8)
            .cornerRadius(12, corners: .bottomLeft)
            .cornerRadius(12, corners: .bottomRight)
            .onAppear(perform: viewModel.loadImage)
            .fullScreenCover(isPresented: $showReservation) {
                ReservationView()
            }
    }
}
