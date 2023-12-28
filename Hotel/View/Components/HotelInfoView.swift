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
                    Label("\(String(viewModelRV.reservation!.horating)) \(viewModelRV.reservation!.ratingName)", systemImage: "star.fill").font(.custom("SFProDisplay-Medium", size: 16))
                        .padding(.vertical, 6)
                        .padding(.horizontal, 8)
                        .background(Color("lightYellow"))
                        .cornerRadius(6)
                        .foregroundStyle(Color("brightYellow"))
                    Spacer()
                }
                Text(viewModelRV.reservation!.hotelName).font(.custom("SFProDisplay-Medium", size: 22))
                
                Button {
                    
                } label: {
                    Text(viewModelRV.reservation!.hotelAdress).font(.custom("SFProDisplay-Medium", size: 14))
                }
                
            }.padding().frame(maxWidth: .infinity)
            
        }.background(.white).cornerRadius(12).padding(.top, 10)
    }
}
