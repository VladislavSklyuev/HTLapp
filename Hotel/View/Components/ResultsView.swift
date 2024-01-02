//
//  ResultsView.swift
//  Hotel
//
//  Created by Владислав Склюев on 28.12.2023.
//

import SwiftUI

struct ResultsView: View {
    
    @EnvironmentObject var viewModelRV: ReservationViewModel
    
    let info = ["Тур", "Топливный сбор", "Сервисный сбор", "К оплате"]
    
    var body: some View {
        Section {
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(info, id: \.self) { text in
                        Text(text).font(Font.custom("SF Pro Display", size: 16))
                    }
                }.foregroundStyle(.gray)
                Spacer()
                VStack(alignment: .trailing, spacing: 20) {
                    Text("\(String(viewModelRV.reservation!.tourPrice)) ₽").font(Font.custom("SF Pro Display", size: 16))
                    Text("\(String(viewModelRV.reservation!.fuelCharge)) ₽").font(Font.custom("SF Pro Display", size: 16))
                    Text("\(String(viewModelRV.reservation!.serviceCharge)) ₽").font(Font.custom("SF Pro Display", size: 16))
                    Text("\(String(viewModelRV.totalAmount.formatted())) ₽").font(Font.custom("SF Pro Display", size: 16).weight(.semibold)).foregroundStyle(Color(red: 0.05, green: 0.45, blue: 1))
                    
                }.padding(.trailing).bold()
            }.padding().frame(maxWidth: .infinity)

        }.background(.white).cornerRadius(12)
    }
}
