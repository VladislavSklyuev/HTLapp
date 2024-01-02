//
//  HotelInfo.swift
//  Hotel
//
//  Created by Владислав Склюев on 28.12.2023.
//

import SwiftUI

struct HotelInfoView: View {
    @EnvironmentObject var viewModelRV: ReservationViewModel
    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Label("\(String(viewModelRV.reservation!.horating)) \(viewModelRV.reservation!.ratingName)", systemImage: "star.fill").font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                        .padding(.vertical, 6)
                        .padding(.horizontal, 8)
                        .background(Color("lightYellow"))
                        .cornerRadius(6)
                        .foregroundStyle(Color("brightYellow"))
                    Spacer()
                }
                Text(viewModelRV.reservation!.hotelName).font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                
                Button {
                    
                } label: {
                    Text(viewModelRV.reservation!.hotelAdress).font(Font.custom("SF Pro Display", size: 14).weight(.medium))
                }
                
            }.padding().frame(maxWidth: .infinity)
            
        }.background(.white).cornerRadius(12).padding(.top, 10)
    }
}
