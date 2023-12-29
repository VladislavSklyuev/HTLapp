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
                    Text("Информация о покупателе").font(.custom("SFProDisplay-Medium", size: 22))
                    Spacer()
                }.padding(.bottom, 10)
//                            VStack(alignment: .leading, spacing: 1) {
//                                    Text("Номер телефона").font(.custom("SFProDisplay-Medium", size: 12)).foregroundStyle(.gray)
//                                
//
//                            }.padding(10).background(.gray.opacity(0.1)).cornerRadius(10)
                VStack(alignment: .leading, spacing: 1) {
                    Text("Почта").font(.custom("SFProDisplay-Medium", size: 12)).foregroundStyle(.gray)
                    TextField("", text: $mail).font(.custom("SFProDisplay-Medium", size: 16))
                        .onChange(of: mail) { oldValue, newValue in
                            viewModelRV.checkMail(mail: newValue)
                        }
                }.padding(10).background(viewModelRV.inputErrorMail ? Color("warning") : .gray.opacity(0.1)).cornerRadius(10)
                HStack {
                    Text("Эти данные никому не передаются. После оплаты мы вышлим чек на указанные вами номер и почту").font(.custom("SFProDisplay-Medium", size: 14))
                }.padding(.vertical, 6).foregroundStyle(.gray)
            }.padding().frame(maxWidth: .infinity)
        }.background(.white).cornerRadius(12)
    }
}
