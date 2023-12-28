//
//  ResultsView.swift
//  Hotel
//
//  Created by Владислав Склюев on 28.12.2023.
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var viewModelRV: ReservationViewModel
    var body: some View {
        Section {
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Тур").font(.custom("SFProDisplay-Medium", size: 16))
                    Text("Топливный сбор").font(.custom("SFProDisplay-Medium", size: 16))
                    Text("Сервисный сбор").font(.custom("SFProDisplay-Medium", size: 16))
                    Text("К оплате").font(.custom("SFProDisplay-Medium", size: 16))
                    
                }.foregroundStyle(.gray)
                Spacer()
                VStack(alignment: .trailing, spacing: 20) {
                    Text("\(String(viewModelRV.reservation!.tourPrice)) ₽").font(.custom("SFProDisplay-Medium", size: 16))
                    Text("\(String(viewModelRV.reservation!.fuelCharge)) ₽").font(.custom("SFProDisplay-Medium", size: 16))
                    Text("\(String(viewModelRV.reservation!.serviceCharge)) ₽").font(.custom("SFProDisplay-Medium", size: 16))
                    Text("\(String(viewModelRV.totalAmount)) ₽").font(.custom("SFProDisplay-Medium", size: 16)).foregroundStyle(.blue)
                    
                }.padding(.trailing).bold()
            }.padding().frame(maxWidth: .infinity)

        }.background(.white).cornerRadius(12)
    }
}
