
//
//  Loader.swift
//  ChoufearApp
//
//  Created by Shaban Kamel on 28/10/2021.

import SwiftUI

//public struct ProgressIndicator: View {
//
//    @State public var isLoading = false
//    @State public var rightOffset :CGFloat = 110
//    @State public var leftOffset :CGFloat = -100
//
//    public init(){}
//
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//
//    public var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 3)
//                .stroke(Color(.systemGray5), lineWidth: 3)
//                .frame(width: 250, height: 3)
//
//            RoundedRectangle(cornerRadius: 3)
//                .stroke(Colors.darkIndigo.swiftUiColor, lineWidth: 3)
//                .frame(width: 30, height: 3)
//
//
//        }.onAppear{
//            self.isLoading = true
//        }
//        .onReceive(timer) { time in
//
//            self.isLoading = true
//            if rightOffset == 110 {
//                rightOffset = -110
//                leftOffset = 100
//            }else {
//                rightOffset = 110
//                leftOffset = -110
//            }
//
//        }
//    }
//}


 public struct ProgressIndicator: View {
     
     @State private var isLoading = false
     @State private var rightOffset :CGFloat = 110
     @State private var leftOffset :CGFloat = -110
     

     let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    public init(){}

     
     public var body: some View {
         ZStack {
             RoundedRectangle(cornerRadius: 3)
                 .stroke(Color(.systemGray5), lineWidth: 3)
                 .frame(width: UIScreen.screenWidth - 32 , height: 3)
             
             RoundedRectangle(cornerRadius: 3)
                .stroke(Colors.darkIndigo.swiftUiColor, lineWidth: 3)
                 .frame(width: 150, height: 3)
                 .offset(x: isLoading ? rightOffset : leftOffset, y: 0)
                 .animation(Animation.linear(duration: 1))
         }.onAppear{
             self.isLoading = true
         }
         .onReceive(timer) { time in
             
             self.isLoading = true
             if rightOffset == 110 {
                 rightOffset = -110
                 leftOffset = 110
             }else {
                 rightOffset = 110
                 leftOffset = -110
             }
             
         }
     }
 }

