//
//  ContentView.swift
//  HoTML
//
//  Created by Владислав Склюев on 18.12.2023.
//

import SwiftUI

struct HotelView: View {
    @StateObject var viewModel = HotelViewModel()
    
    @State private var showRooms = false
    
    var body: some View {
        Section {
            Spacer()
                    Text("Отель").font(Font.custom("SF Pro Display", size: 18).weight(.medium))
        }
        
        if viewModel.currentHotel == nil {
            ProgressView()
        } else {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Section {
                        VStack(alignment: .leading, spacing: 10) {
                            RectangleView(images: $viewModel.image)
                            
                            Label("\(String(viewModel.currentHotel!.rating)) \(viewModel.currentHotel!.ratingName)", systemImage: "star.fill").font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                                .padding(.vertical, 6)
                                .padding(.horizontal, 8)
                                .background(Color("lightYellow"))
                                .cornerRadius(6)
                                .foregroundStyle(Color("brightYellow"))
                            Text(viewModel.currentHotel!.name).font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                            
                            Button(viewModel.currentHotel!.adress) { }
                                .font(Font.custom("SF Pro Display", size: 14).weight(.medium))
                                .foregroundStyle(.blue)
                            HStack(alignment: .bottom) {
                                Text("от \(String(viewModel.currentHotel!.minimalPrice.formatted())) ₽")
                                    .font(Font.custom("SF Pro Display", size: 30).weight(.medium))
                                
                                Text(viewModel.currentHotel!.priceForIt.lowercased()).font(Font.custom("SF Pro Display", size: 16))
                                    .padding(.bottom, 3)
                                    .foregroundStyle(Color("gray1"))
                            }.padding(.top, 8)
                        }.padding([.horizontal, .bottom])
                        
                    }.background(.white)
                        .cornerRadius(12, corners: .bottomLeft)
                        .cornerRadius(12, corners: .bottomRight)
                    Section {
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Об отеле").font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                            TagCloudView(tags: viewModel.currentHotel!.aboutTheHotel.peculiarities)
                            
                            Text(viewModel.currentHotel!.aboutTheHotel.description).font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                                .foregroundColor(.black.opacity(0.9))
                                .frame(width: 343, alignment: .topLeading)
                            FeatureButton()
                        }
                        .padding()
                    }.background(.white)
                        .cornerRadius(12)
                    Section {
                        Button {
                            showRooms.toggle()
                        } label: {
                            Text("К выбору номера").font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                                .frame(height: 48)
                                .frame(maxWidth: .infinity)
                                .background(.blue)
                                .foregroundStyle(.white)
                                .cornerRadius(12)
                                .padding()
                        }
                    }.background(.white)
                }
                .background(Color("backGray"))
            }
            .background(.white)
            .fullScreenCover(isPresented: $showRooms) {
                RoomsView().environmentObject(viewModel)
            }
        }
    }
}
