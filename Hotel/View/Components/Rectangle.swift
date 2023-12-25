//
//  Rectangle.swift
//  Hotel
//
//  Created by Владислав Склюев on 26.12.2023.
//

import SwiftUI

struct CircleView: View {
    @Binding var count: Int
    @Binding var selectedIndex: Int

    var body: some View {
        HStack {
            ForEach(0..<count) { index in
                Circle()
                    .fill(selectedIndex == index ? Color.blue : Color.gray)
                    .frame(width: 10, height: 10)
            }
        }
    }
}

//struct ContentView: View {
//    @State var selectedIndex = 0
//
//    var body: some View {
//        TabView(selection: $selectedIndex) {
//            ForEach(0..<5) { index in
//                Image(systemName: "photo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .tag(index)
//            }
//        }
//        .tabViewStyle(.page(indexDisplayMode: .never))
//        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//        .overlay(CircleView(count: 5, selectedIndex: selectedIndex).padding(), alignment: .bottom)
//    }
//}

//struct ContentView: View {
//    @State var selectedIndex = 0
//
//    var body: some View {
//        VStack {
//            Image(systemName: "photo")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .padding()
//
//            CircleView(count: 5, selectedIndex: selectedIndex)
//                .padding()
//
//            Button("Next") {
//                selectedIndex = (selectedIndex + 1) % 5
//            }
//        }
//    }
//}
//struct CircleListView: View {
//    let colors: [Color] = [.red, .green, .blue, .orange, .pink] // массив цветов
//    let items: [UIImage] // массив элементов
//    @State private var selectedIndex: Int = 0 // выбранный индекс
//    
//    var body: some View {
//        HStack(spacing: 10) {
//            ForEach(0..<items.count) { index in
//                HStack {
//                    Circle()
//                        .fill(self.selectedIndex == index ? .black : .gray)
//                        .frame(width: 7, height: 7)
//                }
//                .onTapGesture {
//                    self.selectedIndex = index
//                }
//            }
//        }.frame(width: 75, height: 17).background(.white).cornerRadius(5)
//    }
//}

//#Preview {
//    CircleListView(items: ["1", "2","3"])
//}
