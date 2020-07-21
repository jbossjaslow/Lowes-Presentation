////
////  ButtonStyle.swift
////  Lowes Presentation
////
////  Created by Jasmine Reyes on 7/20/20.
////  Copyright © 2020 Josh Jaslow. All rights reserved.
////
//
//
////NOT CURRENTLY USED
//import UIKit
//import SwiftUI
//
//struct ContentView: View {
//
//    var body: some View {
//
//        VStack {
// 
//            Button(action: {
//                print("Share tapped!")
//            }) {
//                HStack {
//                    Image(systemName: "square.and.arrow.up")
//                        .font(.title)
//                    Text("Share")
//                        .fontWeight(.semibold)
//                        .font(.title)
//                }
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .padding()
//                .foregroundColor(.white)
//                .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
//                .cornerRadius(40)
//                .padding(.horizontal, 20)
//            }
//
//            Button(action: {
//                print("Edit tapped!")
//            }) {
//                HStack {
//                    Image(systemName: "square.and.pencil")
//                        .font(.title)
//                    Text("Edit")
//                        .fontWeight(.semibold)
//                        .font(.title)
//                }
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .padding()
//                .foregroundColor(.white)
//                .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
//                .cornerRadius(40)
//                .padding(.horizontal, 20)
//            }
//
//            Button(action: {
//                print("Delete tapped!")
//            }) {
//                HStack {
//                    Image(systemName: "trash")
//                        .font(.title)
//                    Text("Delete")
//                        .fontWeight(.semibold)
//                        .font(.title)
//                }
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .padding()
//                .foregroundColor(.white)
//                .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
//                .cornerRadius(40)
//                .padding(.horizontal, 20)
//            }.buttonStyle(GradientBackgroundStyle)
//
//        }
//    }
//}
//
//struct GradientBackgroundStyle: ButtonStyle {
//
//    func makeBody(configuration: Self.Configuration) -> some View {
//        configuration.label
//            .frame(minWidth: 0, maxWidth: .infinity)
//            .padding()
//            .foregroundColor(.white)
//            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
//            .cornerRadius(40)
//            .padding(.horizontal, 20)
//    }
//}
//
//
