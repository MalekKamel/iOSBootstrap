//
//  IntroScreen.swift
//  Chauffeur
//
//  Created by Shaban Kamel on 23/08/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI
import Presentation

struct SplashScreen: Presentation.AppScreen {
    @ObservedObject var vm: AppOptionVM
    @State var route: Route? = nil
    @State var openSheet: Bool = true
    private var headerTopOffset: CGFloat {
        40
    }
    private var headerHeight: CGFloat {
        UIScreen.screenHeight * 0.45
    }

    var bodyContent: some View {
        ZStack {
            Colors.darkIndigo.swiftUiColor
                    .edgesIgnoringSafeArea(.all)
            VStack {
                HeaderImage()
                HeaderView()
            }
        }
    }

    private func HeaderImage() -> some View {
        Assets.icRiyadh.swiftUiImage
                .resizable()
                .frame(maxWidth: UIScreen.screenWidth, maxHeight: headerHeight)
                .offset(y: headerTopOffset)
    }

    private func HeaderView() -> some View {
        ZStack {
            Color.white
                    .cornerRadius(radius: 30, corners: [.topRight, .topLeft])
            VStack(spacing: 16) {
                Title()
            }
        }.frame(maxWidth: UIScreen.screenWidth,
                        maxHeight: headerHeight + headerTopOffset)
                .edgesIgnoringSafeArea(.bottom)
    }

    private func Title() -> some View {
        Text("Hello World!")
                .foregroundColor(.black)
                .font(.system(size: 24)).bold()
                .padding(.top, 16)
    }

}

extension SplashScreen {
    enum Route: AppRoute {
    }
}

// MARK:- Navigation
extension SplashScreen {

    func NavigationLinks() -> some View {
        Group {
        }
    }

}

extension SplashScreen {
    static func build() -> SplashScreen {
        let vm = AppOptionVM(
                dataManager: DataManager.build(),
                requester: CombineRequester()
        )
        return SplashScreen(vm: vm)
    }
}

struct AppOptionsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen.build()
    }
}


