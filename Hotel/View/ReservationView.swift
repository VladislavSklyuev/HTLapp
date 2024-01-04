//
//  ReservationView.swift
//  Hotel
//
//  Created by Владислав Склюев on 19.12.2023.
//

import SwiftUI

struct ReservationView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject var viewModel = ReservationViewModel()
    
    @FocusState private var isFocused: Bool
    @FocusState private var isFocused2: Bool
    
//    @State private var phone: String = "+7(***)***-**-**"
//    @State private var myPhone: String = "+7(***)***-**-**"
//    @State private var i = 3
    
    @State private var mail = ""
    
    var body: some View {
        if viewModel.reservation == nil {
            ProgressView()
        } else {
            Section {
                VStack {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward").padding(.leading, 8).foregroundStyle(.black).fontWeight(.semibold)
                        }
                        Spacer()
                        Text("Бронирование").font(Font.custom("SF Pro Display", size: 18).weight(.medium))
                        Spacer()
                    }
                }
                .padding(.horizontal).padding(.top, 19)
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    HotelInfoView().environmentObject(viewModel)// - ДАННЫЕ ОТЕЛЯ
                    TourInfoView().environmentObject(viewModel)// - ДАННЫЕ ТУРА
                    BuyerInfoView(mail: $mail).environmentObject(viewModel)// - ИНФО О ПОКУПАТЕЛЕ
                        .focused($isFocused)
                    TouristCell().environmentObject(viewModel)// - ТУРИСТЫ
                        .focused($isFocused2)
                    AddingATourist().environmentObject(viewModel)//-ДОБАВЛЕНИЕ ТУРИСТА
                    ResultsView().environmentObject(viewModel)//-ИТОГИ
                    Section {
                        VStack {
                            Button {
                                viewModel.pay()
                            } label: {
                                Text("Оплатить \(String(viewModel.totalAmount.formatted())) ₽").font(.custom("SFProDisplay-Medium", size: 16)).foregroundStyle(.white)
                            }
                        }.padding().frame(maxWidth: .infinity).background(.blue).cornerRadius(12).padding()
                    }.background(.white).cornerRadius(12)//-ОПЛАТА
                }.frame(maxWidth: .infinity)
                    .background(Color("backGray"))
            }.background(.white)
            .onTapGesture {
                isFocused = false
                isFocused2 = false
                if viewModel.numberPhone.count > 0 && viewModel.numberPhone.count != 11 {
                    viewModel.inputErrorPhone = true
                } else {
                    viewModel.inputErrorPhone = false
                }
            }
            .fullScreenCover(isPresented: $viewModel.inputSuccessfully) {
                OrderView()
            }
            .alert("Ошибка!", isPresented: $viewModel.inputErrorTF) {
                Button("Ок", role: .cancel) {
                    viewModel.inputErrorTF = false
                }
            } message: {
                Text("Все данные необходимо заполнить")
            }  
        }
    }
}
