//
//  OrderView.swift
//  Hotel
//
//  Created by Владислав Склюев on 22.12.2023.
//

import SwiftUI

struct OrderView: View {
    @Environment (\.dismiss) var dismiss
    @State private var goHotel = false
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack {
                    Image("super").resizable().aspectRatio(contentMode: .fill).frame(width: 44, height: 44).background(Circle().foregroundStyle(Color(red: 0.96, green: 0.96, blue: 0.98)).frame(width: 100, height: 100)).padding()
                    Text("Ваш заказ принят в работу!").font(.custom("SFProDisplay-Medium", size: 22)).bold().padding()
                    Text("Подтверждение заказа № \((Int.random(in: 1...999999))) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.").font(.custom("SFProDisplay-Medium", size: 16)).multilineTextAlignment(.center)
                }.padding(.bottom, 150)
                Spacer()
                Button {
                    goHotel.toggle()
                } label: {
                    Text("Супер!").font(.custom("SFProDisplay-Medium", size: 16)).foregroundStyle(.white).frame(maxWidth: .infinity).frame(height: 48).background(.blue).cornerRadius(15)
                }
            }.padding()
                .navigationBarBackButtonHidden()
                .navigationTitle("Заказ оплачен").font(.custom("SFProDisplay-Medium", size: 18)).navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward").foregroundStyle(.black).fontWeight(.semibold)
                        }
                    }
                }
        }
        .fullScreenCover(isPresented: $goHotel) {
                HotelView()
        }
    }
}
