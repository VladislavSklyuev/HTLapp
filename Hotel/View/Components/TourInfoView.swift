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
                    Text("Вылет из").font(.custom("SFProDisplay-Medium", size: 16))
                    Text("Страна, город").font(.custom("SFProDisplay-Medium", size: 16))
                    Text("Даты").font(.custom("SFProDisplay-Medium", size: 16))
                    Text("Кол-во ночей").font(.custom("SFProDisplay-Medium", size: 16))
                    Text("Отель").font(.custom("SFProDisplay-Medium", size: 16)).padding(.bottom, 10)
                    Text("Номер").font(.custom("SFProDisplay-Medium", size: 16)).padding(.bottom, 10)
                    Text("Питание").font(.custom("SFProDisplay-Medium", size: 16))
                }.foregroundStyle(.gray)
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text(viewModelRV.reservation!.departure).font(.custom("SFProDisplay-Medium", size: 16))
                    Text(viewModelRV.reservation!.arrivalCountry).font(.custom("SFProDisplay-Medium", size: 16))
                    Text("\(viewModelRV.reservation!.tourDateStart) - \(viewModelRV.reservation!.tourDateStop)").font(.custom("SFProDisplay-Medium", size: 16))
                    Text("\(String(viewModelRV.reservation!.numberOfNights)) ночей").font(.custom("SFProDisplay-Medium", size: 16))
                    Text(viewModelRV.reservation!.hotelName).font(.custom("SFProDisplay-Medium", size: 16))
                    Text(viewModelRV.reservation!.room).font(.custom("SFProDisplay-Medium", size: 16))
                    Text(viewModelRV.reservation!.nutrition).font(.custom("SFProDisplay-Medium", size: 16))
                }.padding(.leading, 30)
            }.padding().frame(maxWidth: .infinity)
            
        }.background(.white).cornerRadius(12)
    }
}
