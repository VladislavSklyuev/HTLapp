//
//  FeatureButton.swift
//  HoTML
//
//  Created by Владислав Склюев on 18.12.2023.
//
import SwiftUI

struct FeatureButton: View {
//    let image: String
//    let title: String
//    let subtitle: String
//    let hasDivider: Bool
    
    var body: some View {
        
        VStack {
            HStack {
                Image("happy")
                
                VStack(alignment: .leading) {
                    Text("Удобства").font(Font.custom("SF Pro Display", size: 16).weight(.medium)).foregroundStyle(Color("black1"))
                    Text("Самое необходимое").font(Font.custom("SF Pro Display", size: 14).weight(.medium)).foregroundStyle(Color("gray1"))
                }
                Spacer()
                
                Image(systemName: "chevron.forward").padding(.trailing, 8).fontWeight(.semibold)
            }.padding([.horizontal, .top], 15)
            Divider().frame(width: 287).padding(.leading, 20).padding(.vertical, 5)
            
            HStack {
                Image("yes")
                
                VStack(alignment: .leading) {
                    Text("Что включено").font(Font.custom("SF Pro Display", size: 16).weight(.medium)).foregroundStyle(Color("black1"))
                    Text("Самое необходимое").font(Font.custom("SF Pro Display", size: 14).weight(.medium)).foregroundStyle(Color("gray1"))
                }
                Spacer()
                
                Image(systemName: "chevron.forward").padding(.trailing, 8).fontWeight(.semibold)
            }.padding(.horizontal, 15)
            Divider().frame(width: 287).padding(.leading, 20).padding(.vertical, 5)
            
            HStack {
                Image("no")
                
                VStack(alignment: .leading) {
                    Text("Что не включено").font(Font.custom("SF Pro Display", size: 16).weight(.medium)).foregroundStyle(Color("black1"))
                    Text("Самое необходимое").font(Font.custom("SF Pro Display", size: 14).weight(.medium)).foregroundStyle(Color("gray1"))
                }
                Spacer()
                
                Image(systemName: "chevron.forward").padding(.trailing, 8).fontWeight(.semibold)
            }.padding([.horizontal, .bottom], 15)
            Spacer()
            
        }.background(Color(red: 0.98, green: 0.98, blue: 0.99))
            .cornerRadius(15)
          
//            HStack(spacing: 16) {
//                Image(image)
//                    .resizable()
//                    .frame(width: 28, height: 28)
//                VStack(alignment: .leading) {
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text(title).font(.custom("SFProDisplay-Medium", size: 16)).fontWeight(.medium)
//                            Text(subtitle).font(.custom("SFProDisplay-Medium", size: 14)).fontWeight(.medium)
//                                //.font(.callout)
//                                .foregroundColor(.gray)
//                        }
//                        Spacer()
//                        Image(systemName: "chevron.forward")
//                    }
//                    if hasDivider {
//                        Divider()
//                    }
//                }
//            }
        }
    }
