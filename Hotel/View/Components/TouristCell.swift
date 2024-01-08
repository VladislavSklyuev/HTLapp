//
//  AddedTouristCell.swift
//  Hotel
//
//  Created by Владислав Склюев on 23.12.2023.
//

import SwiftUI

struct TouristCell: View {
    @EnvironmentObject var viewModelRV: ReservationViewModel
    
    var body: some View {
        Section {
            if viewModelRV.tourists.isEmpty {
                EmptyView()
            } else {
                
                ForEach(viewModelRV.tourists) { tur in
                    if tur.showContent {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(tur.position).font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                                Spacer()
                                Button {
                                    viewModelRV.changeVisibility(id: tur.id)
                                } label: {
                                    VStack {
                                        Image(systemName: "chevron.up").foregroundStyle(.blue).fontWeight(.semibold)
                                    }.frame(width: 30, height: 30).background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1)).cornerRadius(6)
                                }
                            }.padding(.bottom, 10)
                            
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Имя").font(Font.custom("SF Pro Display", size: 12)).foregroundStyle(Color("ColorTurInfoTextUP")).kerning(0.12)
                                TextField("", text: $viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].name).font(Font.custom("SF Pro Display", size: 16)).foregroundStyle(Color("ColorTurInfoText")).kerning(0.75).onChange(of: viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].name) { old, new in
                                    if new.count == 0 {
                                        viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![1] = ""
                                    } else {
                                        viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![1] = new
                                    }
                                }
                                    
                            }.padding(10).background(viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![1] == "" ? Color("warning") : Color("bgColorTurTF")).cornerRadius(6)
                            
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Фамилия").font(Font.custom("SF Pro Display", size: 12)).foregroundStyle(Color("ColorTurInfoTextUP")).kerning(0.12)
                                TextField("", text: $viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].lastName).font(Font.custom("SF Pro Display", size: 16)).foregroundStyle(Color("ColorTurInfoText")).kerning(0.75).onChange(of: viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].lastName) { old, new in
                                    if new.count == 0 {
                                        viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![2] = ""
                                    } else {
                                        viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![2] = new
                                    }
                                }
                                
                            }.padding(10).background(viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![2] == "" ? Color("warning") : Color("bgColorTurTF")).cornerRadius(6)
                            
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Дата рождения").font(Font.custom("SF Pro Display", size: 12)).foregroundStyle(Color("ColorTurInfoTextUP")).kerning(0.12)
                                TextField("", text: $viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].dateOfBirth).font(Font.custom("SF Pro Display", size: 17)).kerning(0.17).foregroundStyle(Color("ColorTurInfoText")).onChange(of: viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].dateOfBirth) { old, new in
                                    if new.count == 0 {
                                        viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![3] = ""
                                    } else {
                                        viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![3] = new
                                    }
                                }
                            }.padding(10).background(viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![3] == "" ? Color("warning") : Color("bgColorTurTF")).cornerRadius(6)
                            
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Гражданство").font(Font.custom("SF Pro Display", size: 12)).foregroundStyle(Color("ColorTurInfoTextUP")).kerning(0.12)
                                TextField("", text: $viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].citizenship).font(Font.custom("SF Pro Display", size: 17)).kerning(0.17).foregroundStyle(Color("ColorTurInfoText")).onChange(of: viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].citizenship) { old, new in
                                    if new.count == 0 {
                                        viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![4] = ""
                                    } else {
                                        viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![4] = new
                                    }
                                }
                            }.padding(10).background(viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![4] == "" ? Color("warning") : Color("bgColorTurTF")).cornerRadius(6)
                            
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Номер загранпаспорта").font(Font.custom("SF Pro Display", size: 12)).foregroundStyle(Color("ColorTurInfoTextUP")).kerning(0.12)
                                TextField("", text: $viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].passportNumber).font(Font.custom("SF Pro Display", size: 17)).kerning(0.17).foregroundStyle(Color("ColorTurInfoText")).onChange(of: viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].passportNumber) { old, new in
                                    if new.count == 0 {
                                        viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![5] = ""
                                    } else {
                                        viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![5] = new
                                    }
                                }
                            }.padding(10).background(viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![5] == "" ? Color("warning") : Color("bgColorTurTF")).cornerRadius(6)
                            
                            VStack(alignment: .leading, spacing: 1) {
                                Text("Срок действия загранпаспорта").font(Font.custom("SF Pro Display", size: 12)).foregroundStyle(Color("ColorTurInfoTextUP")).kerning(0.12)
                                TextField("", text: $viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].passportDate).font(Font.custom("SF Pro Display", size: 17)).kerning(0.17).foregroundStyle(Color("ColorTurInfoText")).onChange(of: viewModelRV.tourists[viewModelRV.indexSearch(id: tur.id)!].passportDate) { old, new in
                                    if new.count == 0 {
                                        viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![6] = ""
                                    } else {
                                        viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![6] = new
                                    }
                                }
                            }.padding(10).background(viewModelRV.checkTextField[viewModelRV.indexSearch(id: tur.id)!]![6] == "" ? Color("warning") : Color("bgColorTurTF")).cornerRadius(6)
                            
                        }.padding().frame(maxWidth: .infinity)


                    } else {
                        VStack(alignment: .leading) {
                            HStack(alignment: .center) {
                                Text(tur.position).font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                                Spacer()
                                Button {
                                    viewModelRV.changeVisibility(id: tur.id)
                                } label: {
                                    VStack {
                                        Image(systemName: "chevron.down").foregroundStyle(.blue).fontWeight(.semibold)
                                    }.frame(width: 30, height: 30).background(Color("blue1").opacity(0.1)).cornerRadius(6)
                                }
                            }
                        }.padding().frame(maxWidth: .infinity)
                    }
                }
            }
        }.background(.white).cornerRadius(12)
    }
}
