//
//  AddedTouristCell.swift
//  Hotel
//
//  Created by Владислав Склюев on 23.12.2023.
//

import SwiftUI

struct TouristCell: View {
    @EnvironmentObject var viewModelRV: ReservationViewModel
    @State private var show = true
    
    @State  private var name: String = ""
    @State  private var index: Int?
    
    var body: some View {
        Section {
            if viewModelRV.tourists.isEmpty {
                EmptyView()
            } else {
                
                ForEach(viewModelRV.tourists) { tur in
                    if tur.showContent {
                    //if show {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(tur.position).font(.custom("SFProDisplay-Medium", size: 22))
                                Spacer()
                                Button {
                                    viewModelRV.changeVisibility(id: tur.id)
                                } label: {
                                    VStack {
                                        Image(systemName: "chevron.up").foregroundStyle(.blue).fontWeight(.semibold)
                                    }.frame(width: 30, height: 30).background(.gray.opacity(0.1)).cornerRadius(6)
                                }
                            }.padding(.bottom, 10)
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Имя").font(.system(size: 12)).foregroundStyle(.gray)
                                TextField("", text: $viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].name).font(.custom("SFProDisplay-Medium", size: 16))
                            }.padding(10).background(viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![1] == "" ? Color("warning") : .gray.opacity(0.1)).cornerRadius(6)
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Фамилия").font(.system(size: 12)).foregroundStyle(.gray)
                                TextField("", text: $viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].lastName).font(.custom("SFProDisplay-Medium", size: 16))
                            }.padding(10).background(viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![2] == "" ? Color("warning") : .gray.opacity(0.1)).cornerRadius(6)
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Дата рождения").font(.system(size: 12)).foregroundStyle(.gray)
                                TextField("", text: $viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].dateOfBirth).font(.custom("SFProDisplay-Medium", size: 16))
                            }.padding(10).background(viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![3] == "" ? Color("warning") : .gray.opacity(0.1)).cornerRadius(6)
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Гражданство").font(.system(size: 12)).foregroundStyle(.gray)
                                TextField("", text: $viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].citizenship).font(.custom("SFProDisplay-Medium", size: 16))
                            }.padding(10).background(viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![4] == "" ? Color("warning") : .gray.opacity(0.1)).cornerRadius(6)
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Номер загранпаспорта").font(.system(size: 12)).foregroundStyle(.gray)
                                TextField("", text: $viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].passportNumber).font(.custom("SFProDisplay-Medium", size: 16))
                            }.padding(10).background(viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![5] == "" ? Color("warning") : .gray.opacity(0.1)).cornerRadius(6)
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Срок действия загранпаспорта").font(.system(size: 12)).foregroundStyle(.gray)
                                TextField("", text: $viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].passportDate).font(.custom("SFProDisplay-Medium", size: 16))
                            }.padding(10).background(viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![6] == "" ? Color("warning") : .gray.opacity(0.1)).cornerRadius(6)
                            
                        }.padding().frame(maxWidth: .infinity)
                    } else {
                        VStack(alignment: .leading) {
                            HStack(alignment: .center) {
                                Text(tur.position).font(.custom("SFProDisplay-Medium", size: 22))
                                Spacer()
                                Button {
                                    viewModelRV.changeVisibility(id: tur.id)
                                } label: {
                                    VStack {
                                        Image(systemName: "chevron.down").foregroundStyle(.blue).fontWeight(.semibold)
                                    }.frame(width: 30, height: 30).background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1)).cornerRadius(6)
                                }
                            }
                        }.padding().frame(maxWidth: .infinity)
                    }
                }
            }
                
        }.background(.white).cornerRadius(12)
    }
}

//#Preview {
//    AddedTouristCell()
//}
