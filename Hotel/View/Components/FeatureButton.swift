//
//  FeatureButton.swift
//  HoTML
//
//  Created by Владислав Склюев on 18.12.2023.
//

import SwiftUI

struct FeatureButton: View {
    
    var body: some View {
        
        VStack {
            HStack {
                Image("happy")
                
                VStack(alignment: .leading) {
                    Text("Удобства").font(Font.custom("SF Pro Display", size: 16).weight(.medium)).foregroundStyle(.black)
                    Text("Самое необходимое").font(Font.custom("SF Pro Display", size: 14).weight(.medium)).foregroundStyle(Color("gray1"))
                }
                Spacer()
                
                Image(systemName: "chevron.forward").padding(.trailing, 8).fontWeight(.semibold)
            }.padding([.horizontal, .top], 15)
            Divider().frame(width: 287).padding(.leading, 20).padding(.vertical, 5)
            
            HStack {
                Image("yes")
                
                VStack(alignment: .leading) {
                    Text("Что включено").font(Font.custom("SF Pro Display", size: 16).weight(.medium)).foregroundStyle(.black)
                    Text("Самое необходимое").font(Font.custom("SF Pro Display", size: 14).weight(.medium)).foregroundStyle(Color("gray1"))
                }
                Spacer()
                
                Image(systemName: "chevron.forward").padding(.trailing, 8).fontWeight(.semibold)
            }.padding(.horizontal, 15)
            Divider().frame(width: 287).padding(.leading, 20).padding(.vertical, 5)
            
            HStack {
                Image("no")
                
                VStack(alignment: .leading) {
                    Text("Что не включено").font(Font.custom("SF Pro Display", size: 16).weight(.medium)).foregroundStyle(.black)
                    Text("Самое необходимое").font(Font.custom("SF Pro Display", size: 14).weight(.medium)).foregroundStyle(Color("gray1"))
                }
                Spacer()
                
                Image(systemName: "chevron.forward").padding(.trailing, 8).fontWeight(.semibold)
            }.padding([.horizontal, .bottom], 15)
            Spacer()
            
        }.background(Color(red: 0.98, green: 0.98, blue: 0.99))
            .cornerRadius(15)
        }
    }
