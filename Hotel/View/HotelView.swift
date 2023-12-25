//
//  ContentView.swift
//  HoTML
//
//  Created by Владислав Склюев on 18.12.2023.
//

import SwiftUI

struct HotelView: View {
    @StateObject var viewModel = HotelViewModel()
    
    @State private var showNumber = false
    @State private var showRooms = false
    var body: some View {
        Section {
            VStack {
                HStack {
                    Text("Отель").font(.custom("SFProDisplay-Medium", size: 18)).fontWeight(.medium)
                }
            }
            
            .padding()
        }
        
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {

                Section {
                    VStack(alignment: .leading, spacing: 10) {
                        TabView {
                            if viewModel.image.isEmpty {
                                ProgressView()
                            } else {
                                ForEach(viewModel.image, id: \.self) { image in
                                    Image(uiImage: image).resizable().aspectRatio(contentMode: .fill)
                                }
                            }
                        }.frame(height: 260)
                            .tabViewStyle(.page)
                            .cornerRadius(12)
                            .padding(.bottom, 8)
                        
                        Label("\(String(viewModel.currentHotel.rating)) \(viewModel.currentHotel.ratingName)", systemImage: "star.fill").font(.custom("SFProDisplay-Medium", size: 16)).fontWeight(.medium)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 8)
                            .background(Color("lightYellow"))
                            .cornerRadius(6)
                            .foregroundStyle(Color("brightYellow"))
                        Text(viewModel.currentHotel.name).font(.custom("SFProDisplay-Medium", size: 22)).fontWeight(.medium)

                        Button(viewModel.currentHotel.adress) { }
                            .font(.custom("SFProDisplay-Medium", size: 14)).fontWeight(.medium)
                            .foregroundStyle(.blue)
                        HStack(alignment: .bottom) {
                            Text("от \(String(viewModel.currentHotel.minimalPrice.formatted())) ₽")
                                .font(.custom("SFProDisplay-Medium", size: 30).weight(.semibold))
                                
                            Text(viewModel.currentHotel.priceForIt).font(.custom("SFProDisplay-Medium", size: 16))
                                .padding(.bottom, 3)
                                .foregroundStyle(.gray)
                        }.padding(.top, 8)
                    }.padding()
                    
                }.background(.white)
                    .cornerRadius(12, corners: .bottomLeft)
                    .cornerRadius(12, corners: .bottomRight)
                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Об отеле").font(.custom("SFProDisplay-Medium", size: 22)).fontWeight(.medium)
                        TagCloudView(tags: viewModel.currentHotel.aboutTheHotel.peculiarities)
                        
                        Text(viewModel.currentHotel.aboutTheHotel.description).font(.custom("SFProDisplay-Medium", size: 16))
                        VStack {
                            FeatureButton(image: "happy", title: "Удобства", subtitle: "Самое необходимое", hasDivider: true)
                            
                            FeatureButton(image: "yes", title: "Что включено", subtitle: "Самое необходимое", hasDivider: true)
                            
                            FeatureButton(image: "no", title: "Что не включено", subtitle: "Самое необходимое", hasDivider: false)
                        }
                        .padding()
                        .background(Color("backGray"))
                        .cornerRadius(12)
                        .padding()

                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                }.background(.white)
                    .cornerRadius(12)
                Section {
                    Button {
                        showRooms.toggle()
                    } label: {
                        Text("К выбору номера")
                            .frame(height: 48)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .cornerRadius(12)
                            .padding()
                    }

                }.background(.white)
            }
            //.onAppear(perform:viewModel.downLoadPhoto)
            .background(Color("backGray"))
        }
        .background(.white)
        .fullScreenCover(isPresented: $showRooms) {
            RoomsView().environmentObject(viewModel)
        }
    }
}

#Preview {
    NavigationView {
        HotelView()
    }
}
