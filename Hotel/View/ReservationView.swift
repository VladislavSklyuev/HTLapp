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
    @State private var mail = ""
    
    @State private var showFirstTourist = true
    @State private var showSecondTourist = false
    
    @State private var look = false
    @State private var tourists: [Tourist] = []
    
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
                            Image(systemName: "chevron.backward").foregroundStyle(.black).fontWeight(.semibold)
                        }
                        Spacer()
                        Text("Бронирование").font(.custom("SFProDisplay-Medium", size: 18)).fontWeight(.medium)
                        Spacer()
                    }
                }
                
                .padding()
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Section {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Label("\(String(viewModel.reservation!.horating)) \(viewModel.reservation!.ratingName)", systemImage: "star.fill").font(.custom("SFProDisplay-Medium", size: 16))
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 8)
                                    .background(Color("lightYellow"))
                                    .cornerRadius(6)
                                    .foregroundStyle(Color("brightYellow"))
                                Spacer()
                            }
                            Text(viewModel.reservation!.hotelName).font(.custom("SFProDisplay-Medium", size: 22))
                            
                            Button {
                                
                            } label: {
                                Text(viewModel.reservation!.hotelAdress).font(.custom("SFProDisplay-Medium", size: 14))
                            }
                            
                        }.padding().frame(maxWidth: .infinity)
                        
                    }.background(.white).cornerRadius(12).padding(.top, 10)
                    Section {
                        HStack {
                            //HStack {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Вылет из").font(.custom("SFProDisplay-Medium", size: 16))
                                Text("Страна, город").font(.custom("SFProDisplay-Medium", size: 16))
                                Text("Даты").font(.custom("SFProDisplay-Medium", size: 16))
                                Text("Кол-во ночей").font(.custom("SFProDisplay-Medium", size: 16))
                                Text("Отель").font(.custom("SFProDisplay-Medium", size: 16)).padding(.bottom, 10)
                                Text("Номер").font(.custom("SFProDisplay-Medium", size: 16)).padding(.bottom, 10)
                                Text("Питание").font(.custom("SFProDisplay-Medium", size: 16))
                            }.foregroundStyle(.gray)
                            //}
                            Spacer()
                            //HStack {
                            VStack(alignment: .leading, spacing: 20) {
                                Text(viewModel.reservation!.departure).font(.custom("SFProDisplay-Medium", size: 16))
                                Text(viewModel.reservation!.arrivalCountry).font(.custom("SFProDisplay-Medium", size: 16))
                                Text("\(viewModel.reservation!.tourDateStart) - \(viewModel.reservation!.tourDateStop)").font(.custom("SFProDisplay-Medium", size: 16))
                                Text("\(String(viewModel.reservation!.numberOfNights)) ночей").font(.custom("SFProDisplay-Medium", size: 16))
                                Text(viewModel.reservation!.hotelName).font(.custom("SFProDisplay-Medium", size: 16))
                                Text(viewModel.reservation!.room).font(.custom("SFProDisplay-Medium", size: 16))
                                Text(viewModel.reservation!.nutrition).font(.custom("SFProDisplay-Medium", size: 16))
                            }.padding(.leading, 30)
                            //}
                        }.padding().frame(maxWidth: .infinity)
                        
                    }.background(.white).cornerRadius(12)//ДАННЫЕ ТУРА - В ОТДЕЛЬНУЮ СТРУКТУРУ?
                    Section {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Информация о покупателе").font(.custom("SFProDisplay-Medium", size: 22))
                                Spacer()
                            }.padding(.bottom, 10)
                            VStack(alignment: .leading, spacing: 1) {
                                    Text("Номер телефона").font(.custom("SFProDisplay-Medium", size: 12)).foregroundStyle(.gray)
                                    
                                MaskedTextField(
                                    text: $viewModel.numberPhone,
                                    value: $viewModel.phoneValue,
                                    complete: $viewModel.phoneComplete,
                                    placeholder: "+7 (***) ***_**_**",
                                    mask: "+7 ([000]) [000]-[00]-[00]"
                                )
                                //TextField("", text: $numberPhone).font(.custom("SFProDisplay-Medium", size: 16))
                            }.padding(10).background(!viewModel.phoneComplete ? Color("warning") : .gray.opacity(0.1)).cornerRadius(10)
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Почта").font(.custom("SFProDisplay-Medium", size: 12)).foregroundStyle(.gray)
                                TextField("", text: $mail).font(.custom("SFProDisplay-Medium", size: 16))
                                    .focused($isFocused)
                                    .onSubmit {
                                        viewModel.checkMail(string: mail)
                                        isFocused = false
                                    }
                            }.padding(10).background(viewModel.inputError ? Color("warning") : .gray.opacity(0.1)).cornerRadius(10)
                            HStack {
                                Text("Эти данные никому не передаются. После оплаты мы вышлим чек на указанные вами номер и почту").font(.custom("SFProDisplay-Medium", size: 14))
                            }.padding(.vertical, 6).foregroundStyle(.gray)
                        }.padding().frame(maxWidth: .infinity)
                    }.background(.white).cornerRadius(12)//ИНФО О ПОКУПАТЕЛЕ
                    TouristCell().environmentObject(viewModel)//-ТУРИСТЫ, не на всех ячейках отображается некорректный ввод
                    Section {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Добавить туриста").font(.custom("SFProDisplay-Medium", size: 22))
                                Spacer()
                                Button {
                                    viewModel.addTourist()
                                } label: {
                                    VStack {
                                        Image(systemName: "plus").foregroundStyle(.white).fontWeight(.semibold)
                                    }.frame(width: 30, height: 30).background(Color(red: 0.05, green: 0.45, blue: 1)).cornerRadius(6)
                                }
                            }
                        }.padding().frame(maxWidth: .infinity)
                    }.background(.white).cornerRadius(12)//-ДОБАВИТЬ ТУРИСТА
                    
                    Section {
                        HStack {
                            //HStack {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Тур").font(.custom("SFProDisplay-Medium", size: 16))
                                Text("Топливный сбор").font(.custom("SFProDisplay-Medium", size: 16))
                                Text("Сервисный сбор").font(.custom("SFProDisplay-Medium", size: 16))
                                Text("К оплате").font(.custom("SFProDisplay-Medium", size: 16))
                                
                            }.foregroundStyle(.gray)
                            //}
                            Spacer()
                            //HStack {
                            VStack(alignment: .trailing, spacing: 20) {
                                Text("\(String(viewModel.reservation!.tourPrice)) ₽").font(.custom("SFProDisplay-Medium", size: 16))
                                Text("\(String(viewModel.reservation!.fuelCharge)) ₽").font(.custom("SFProDisplay-Medium", size: 16))
                                Text("\(String(viewModel.reservation!.serviceCharge)) ₽").font(.custom("SFProDisplay-Medium", size: 16))
                                Text("\(String(viewModel.totalAmount)) ₽").font(.custom("SFProDisplay-Medium", size: 16)).foregroundStyle(.blue)
                                
                            }.padding(.trailing).bold()
                                
                            //}
                        }.padding().frame(maxWidth: .infinity)
            
                    }.background(.white).cornerRadius(12)//-ИТОГИ
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
            }
            .fullScreenCover(isPresented: $viewModel.inputSuccessfully) {
                OrderView()
            }
            .background(.white)
//            .navigationBarBackButtonHidden()
//            .navigationTitle("Бронирование")
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button {
//                        dismiss()
//                    } label: {
//                        Image(systemName: "chevron.backward").foregroundStyle(.black).fontWeight(.semibold)
//                    }
//                }
//            }
        }
    }
}
#Preview {
    ReservationView()
}

//Section {
//    NavigationLink {
//        NumberView()
//    } label: {
//        Text("К выбору номера")
//            .frame(height: 42)
//            .frame(maxWidth: .infinity)
//            .background(.blue)
//            .foregroundStyle(.white)
//            .cornerRadius(12)
//            .padding()
//    }
//
//}.background(.white)
