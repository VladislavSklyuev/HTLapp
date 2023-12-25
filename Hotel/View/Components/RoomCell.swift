//
//  RoomCell.swift
//  Hotel
//
//  Created by Владислав Склюев on 19.12.2023.
//

import SwiftUI

struct RoomCell: View {
    @StateObject var viewModel: RoomCellViewModel
    @State private var showReservation = false
    
    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 10) {
                
                TabView {
                    ForEach(viewModel.image, id: \.self) { image in
                        Image(uiImage: image).resizable().aspectRatio(contentMode: .fill)
                    }
                }
                
                .frame(height: 260)
                    .tabViewStyle(.page)
                    .cornerRadius(12)
                
                Text(viewModel.position.name).font(.custom("SFProDisplay-Medium", size: 22)).fontWeight(.medium)
                
                TagCloudView(tags: viewModel.position.peculiarities)

                Button {
                    
                } label: {
                    HStack(spacing: 6) {
                        Text("Подробнее о номере").font(.custom("SFProDisplay-Medium", size: 16))
                        Image(systemName: "chevron.forward").bold()
                    }.padding(.leading, 12).padding(.trailing, 10).frame(height: 35).background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1)).cornerRadius(5)
                }
                
                HStack(alignment: .bottom) {
                    Text("\(String(viewModel.position.price.formatted()))₽")
                        .font(.custom("SFProDisplay-Medium", size: 30)).fontWeight(.semibold)
                    Text(viewModel.position.pricePer)
                        .padding(.bottom, 3)
                        .font(.custom("SFProDisplay-Medium", size: 16))
                        .foregroundStyle(.gray)
                }.padding(.vertical, 8)
                
                Button {
                    showReservation.toggle()
                } label: {
                    Text("Выбрать номер").font(.custom("SFProDisplay-Medium", size: 16))
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(12)
                        //.padding()
                }
            }.padding()

        }.background(.white)
            .padding(.top, 8)
            .cornerRadius(12, corners: .bottomLeft)
            .cornerRadius(12, corners: .bottomRight)
            .onAppear(perform: viewModel.loadImage)
            .fullScreenCover(isPresented: $showReservation) {
                ReservationView()
            }
    }
}

#Preview {
    RoomCell(viewModel: RoomCellViewModel(position: .init(id: 1, name: "HILTON", price: 234532, pricePer: "За сутки без кровати", peculiarities: ["Лучший отель", "Проводной интернет"], imageUrls: ["https://www.atorus.ru/sites/default/files/upload/image/News/56871/%D1%80%D0%B8%D0%BA%D1%81%D0%BE%D1%81%20%D1%81%D0%B8%D0%B3%D0%B5%D0%B9%D1%82.jpg"])))
}
