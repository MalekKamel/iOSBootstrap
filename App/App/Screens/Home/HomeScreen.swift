//
//  HomeScreen.swift
//  EcommerceTemplate
//
//  Created by Shaban on 03/01/2022.
//  Copyright © 2022 Shaban. All rights reserved.
//

import SwiftUI
import SwiftUINavigator

struct HomeScreen: AppScreen {
    @ObservedObject var vm: HomeVM
    @State private var isSideMenuOpen: Bool = false

    @State var cart: Cart = .shared

    var bodyContent: some View {
        AppTabBar(
                tabs: [
                    TabItem(image: Image(systemName: .houseFill)) {
                        ProductsScreen.build(items: Fake.products).eraseToAnyView
                    },
                    TabItem(image: Image(systemName: .cartFill)) {
                        CartScreen.build().eraseToAnyView
                    },
                    TabItem(image: Image(systemName: .heartFill)) {
                        ProductsScreen.build(items: Favorites.shared.items).eraseToAnyView
                    },
                    TabItem(image: Image(systemName: .gear)) {
                        SettingsScreen.build().eraseToAnyView
                    }
                ])
    }

}

extension HomeScreen {
    static func build() -> some View {
        let vm = HomeVM(
                dataManager: DataManager.build(),
                requester: AsyncMan()
        )
        return HomeScreen(vm: vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen.build()
    }
}

extension View {
    var eraseToAnyView: AnyView {
        AnyView(self)
    }
}
