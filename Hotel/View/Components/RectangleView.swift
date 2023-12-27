//
//  Rectangle.swift
//  Hotel
//
//  Created by Владислав Склюев on 25.12.2023.
//

import SwiftUI

struct RectangleView: View {
    @Binding var images: [UIImage]
    @State private var index: Int = 0
    
    var body: some View {
        TabView {
            if images.isEmpty {
                ProgressView()
            } else {
                
                Image(uiImage: images[index])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    //.scaledToFit()
                    .gesture(
                        DragGesture(minimumDistance: 50)
                            .onEnded { value in
                                if value.translation.width < 0 {
                                    index += 1
                                    if index >= images.count {
                                        index = 0
                                    }
                                } else if value.translation.width > 0 {
                                    index -= 1
                                    if index < 0 {
                                        index = images.count - 1
                                    }
                                }
                            }
                    )
                    .overlay {
                        if images.count >= 2 {
                            HStack(spacing: 5) {
                                
                                ForEach(0..<2) { index in
                                    Circle()
                                        .fill(self.index == index ? Color.black : Color.gray)
                                        .frame(width: 7, height: 7)
                                }
                            }.padding(.vertical, 5).padding(.horizontal, 10).background(.white).cornerRadius(5).offset(y: 110)
                        } else if images.count == 1 {
                            HStack(spacing: 5) {
                                Circle()
                                    .fill(.black)
                                    .frame(width: 7, height: 7)
                            }.padding(.vertical, 5).padding(.horizontal, 10).background(.white).cornerRadius(5).offset(y: 110)
                        } else {
                            HStack(spacing: 5) {
                                Circle()
                                    .fill(.black)
                                    .frame(width: 7, height: 7)
                                Circle()
                                    .fill(.black.opacity(0.22))
                                    .frame(width: 7, height: 7)
                                Circle()
                                    .fill(.black.opacity(0.17))
                                    .frame(width: 7, height: 7)
                                Circle()
                                    .fill(.black.opacity(0.1))
                                    .frame(width: 7, height: 7)
                                Circle()
                                    .fill(.black.opacity(0.05))
                                    .frame(width: 7, height: 7)
                            }.padding(.vertical, 5).padding(.horizontal, 10).background(.white).cornerRadius(5).offset(y: 110)
                        }
                    }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 257)
        .cornerRadius(12)
        .padding(.bottom, 8)
    }
    
//    var body: some View {
//        TabView(selection: $selectedIndex) {
//            if images.isEmpty {
//                ProgressView()
//            } else {
//                ForEach(images, id: \.self) { image in
//                    Image(uiImage: image)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        //.tag(index)
//                }
//            }
//        }
//        .tabViewStyle(.page(indexDisplayMode: .never))
//        .frame(height: 260)
//        .cornerRadius(12)
//        .padding(.bottom, 8)
//
//        .overlay {
//            HStack(spacing: 5) {
//                ForEach(0..<5) { index in
//                    Circle()
//                        .fill(selectedIndex == index ? Color.blue : Color.gray)
//                        .frame(width: 7, height: 7)
//                }
//            }.padding(.vertical, 5).padding(.horizontal, 10).background(.white).cornerRadius(5).offset(y: 110)
//        }
//
//    }
}

//#Preview {
//    RectangleView()
//}
