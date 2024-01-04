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
                VStack(alignment: .leading, spacing: 1) {
                    Text("Номер телефона").font(Font.custom("SF Pro Display", size: 12)).foregroundStyle(Color("ColorTurInfoTextUP")).kerning(0.12)
                    TextField("", text: $viewModelRV.phone)
                        .onTapGesture {
                            viewModelRV.phone = "+7(***)***-**-**"
                        }
                        .keyboardType(.numberPad)
                        .onChange(of: viewModelRV.phone) { oldValue, newValue in
                            //print(oldValue)
                            //print(newValue)
                            if oldValue.count < 16 && newValue.count >= oldValue.count {
                                viewModelRV.phone = "+7(***)***-**-**"
                                viewModelRV.myPhone = "+7(***)***-**-**"
                                viewModelRV.i = 3
                            }
                            //print("OLD", oldValue.count)
                            //print("NEW", newValue.count)
                            guard oldValue.count <= newValue.count else { viewModelRV.phone = viewModelRV.myPhone
                                return }
                            viewModelRV.phone = viewModelRV.format(with: "+X(XXX)XXX-XX-XXX", phone: viewModelRV.phone)
                            
                        }
                }.padding(10).background(viewModelRV.inputErrorPhone ? Color("warning") : Color("bgColorTurTF")).cornerRadius(10)
                VStack(alignment: .leading, spacing: 1) {
                    Text("Почта").font(Font.custom("SF Pro Display", size: 12)).foregroundStyle(Color("ColorTurInfoTextUP")).kerning(0.12)
                    TextField("", text: $mail).font(Font.custom("SF Pro Display", size: 16)).foregroundStyle(Color("ColorTurInfoText")).kerning(0.75)
                        .onChange(of: mail) { oldValue, newValue in
                            viewModelRV.checkMail(mail: newValue)
                        }
                }.padding(10).background(viewModelRV.inputErrorMail ? Color("warning") : Color("bgColorTurTF")).cornerRadius(10)
                HStack {
                    Text("Эти данные никому не передаются. После оплаты мы вышлим чек на указанные вами номер и почту").font(Font.custom("SF Pro Display", size: 14))
                }.padding(.vertical, 6).foregroundStyle(Color("gray1"))
            }.padding().frame(maxWidth: .infinity)
        }.background(.white).cornerRadius(12)
    }
}
