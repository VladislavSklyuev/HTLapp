//
//  FeatureButton.swift
//  HoTML
//
//  Created by Владислав Склюев on 18.12.2023.
//
import SwiftUI

struct FeatureButton: View {
    let image: String
    let title: String
    let subtitle: String
    let hasDivider: Bool
    
    var body: some View {

        
            HStack(spacing: 16) {
                Image(image)
                    .resizable()
                    .frame(width: 28, height: 28)
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(title).font(.custom("SFProDisplay-Medium", size: 16)).fontWeight(.medium)
                            Text(subtitle).font(.custom("SFProDisplay-Medium", size: 14)).fontWeight(.medium)
                                //.font(.callout)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "chevron.forward")
                    }
                    if hasDivider {
                        Divider()
                    }
                
                }
                
            }

        }
    }


#Preview {
    FeatureButton(image: "checkmark.square", title: "Удобства", subtitle: "Самое необходимое", hasDivider: true)
}
