//
//  BuyerInfo.swift
//  Hotel
//
//  Created by Владислав Склюев on 28.12.2023.
//

import SwiftUI

struct BuyerInfoView: View {
    @EnvironmentObject var viewModelRV: ReservationViewModel
    @FocusState private var isFocused: Bool
    @Binding var mail: String
      
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                HStack {
                    Text("Информация о покупателе").font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                    Spacer()
                }.padding(.bottom, 10)
//                            VStack(alignment: .leading, spacing: 1) {
//                                    Text("Номер телефона").font(.custom("SFProDisplay-Medium", size: 12)).foregroundStyle(.gray)
//                                // Callout 2
//
//                            }.padding(10).background(.gray.opacity(0.1)).cornerRadius(10)
                VStack(alignment: .leading, spacing: 1) {
                    Text("Почта").font(Font.custom("SF Pro Display", size: 12)).foregroundStyle(Color(red: 0.66, green: 0.67, blue: 0.72)).kerning(0.12)
                    TextField("", text: $mail).font(Font.custom("SF Pro Display", size: 16)).foregroundStyle(Color(red: 0.08, green: 0.08, blue: 0.17)).kerning(0.75)
                        .onChange(of: mail) { oldValue, newValue in
                            viewModelRV.checkMail(mail: newValue)
                        }
                }.padding(10).background(viewModelRV.inputErrorMail ? Color("warning") : .gray.opacity(0.1)).cornerRadius(10)
                HStack {
                    Text("Эти данные никому не передаются. После оплаты мы вышлим чек на указанные вами номер и почту").font(Font.custom("SF Pro Display", size: 14))
                }.padding(.vertical, 6).foregroundStyle(Color(red: 0.51, green: 0.53, blue: 0.59))
            }.padding().frame(maxWidth: .infinity)
        }.background(.white).cornerRadius(12)
    }
}
