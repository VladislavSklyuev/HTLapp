//
//  AddingATourist.swift
//  Hotel
//
//  Created by Владислав Склюев on 28.12.2023.
//

import SwiftUI

struct AddingATourist: View {
    @EnvironmentObject var viewModelRV: ReservationViewModel
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                HStack {
                    Text("Добавить туриста").font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                    Spacer()
                    Button {
                        viewModelRV.addTourist()
                    } label: {
                        VStack {
                            Image(systemName: "plus").foregroundStyle(.white).fontWeight(.semibold)
                        }.frame(width: 30, height: 30).background(Color("blue1")).cornerRadius(6)
                    }
                }
            }.padding().frame(maxWidth: .infinity)
        }.background(.white).cornerRadius(12)
    }
}
