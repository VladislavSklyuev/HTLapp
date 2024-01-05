//
//  TourInformation.swift
//  Hotel
//
//  Created by Владислав Склюев on 28.12.2023.
//

import SwiftUI

struct TourInfoView: View {
    @EnvironmentObject var viewModelRV: ReservationViewModel
    var body: some View {
        Section {
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Вылет из").font(Font.custom("SF Pro Display", size: 16))
                    Text("Страна, город").font(Font.custom("SF Pro Display", size: 16))
                    Text("Даты").font(Font.custom("SF Pro Display", size: 16))
                    Text("Кол-во ночей").font(Font.custom("SF Pro Display", size: 16))
                    Text("Отель").font(Font.custom("SF Pro Display", size: 16)).padding(.bottom, 10)
                    Text("Номер").font(Font.custom("SF Pro Display", size: 16)).padding(.bottom, 10)
                    Text("Питание").font(Font.custom("SF Pro Display", size: 16))
                }.foregroundStyle(Color("gray1"))
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text(viewModelRV.reservation!.departure).font(Font.custom("SF Pro Display", size: 16))
                    Text(viewModelRV.reservation!.arrivalCountry).font(Font.custom("SF Pro Display", size: 16))
                    Text("\(viewModelRV.reservation!.tourDateStart) - \(viewModelRV.reservation!.tourDateStop)").font(Font.custom("SF Pro Display", size: 16))
                    Text("\(String(viewModelRV.reservation!.numberOfNights)) ночей").font(Font.custom("SF Pro Display", size: 16))
                    Text(viewModelRV.reservation!.hotelName).font(Font.custom("SF Pro Display", size: 16))
                    Text(viewModelRV.reservation!.room).font(Font.custom("SF Pro Display", size: 16))
                    Text(viewModelRV.reservation!.nutrition).font(Font.custom("SF Pro Display", size: 16))
                }.padding(.leading, 30)
            }.padding().frame(maxWidth: .infinity)
        }.background(.white).cornerRadius(12)
    }
}
