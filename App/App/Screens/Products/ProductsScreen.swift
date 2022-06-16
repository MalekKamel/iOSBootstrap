//
//  ProductsScreen.swift
//  EcommerceTemplate
//
//  Created by Shaban on 03/01/2022.
//  Copyright © 2022 Shaban. All rights reserved.
//

import SwiftUI
import SwiftUINavigator

struct ProductsScreen: AppScreen {
    @ObservedObject var vm: ProductsVM
    var cart: Cart = .shared
    private let items: [Product]
    @EnvironmentObject private var navigator: Navigator
    @State var selectedNavigationOptions: [ChipGroup.Item] = []

    var bodyContent: some View {
        VStack {
            ContentView()
        }
    }

    private func ContentView() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            HStack(alignment: .top, spacing: 10) {
                let items: [[Product]] = items.split()

                if !items.isEmpty {
                    ItemsView(items: items[0])
                }

                if items.count == 2 {
                    ItemsView(items: items[1])
                }

                if items.isEmpty {
                    NoProductsView()
                }
            }
                    .padding()
        }
                .padding(.bottom, 50)
    }

    private func NoProductsView() -> some View {
        VStack(alignment: .center, spacing: 4) {
            Spacer()
            Image(systemName: "bag.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.gray)
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.bottom, 20)
            Text(Strings.noProductsToDisplay)
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .foregroundColor(Color.gray)
            Spacer()
        }
                .padding(.bottom, 10)
    }

    private func ItemsView(items: [Product]) -> some View {
        VStack(alignment: .center, spacing: 8) {
            ForEach(items, id: \.uuid) { item in
                NavigatorLink(
                        destination: ProductDetailScreen.build(item: item),
                        type: .push()) {
                    // When this view is clicked, it will trigger the navigation
                    ProductItemView(item: item)
                }.buttonStyle(PlainButtonStyle())

                // It's also possible to use Navigator object directly to navigate
                if false {
                    ProductItemView(item: item).onTapGesture {
                        navigator.navigate(type: .push()) {
                            ProductDetailScreen.build(item: item)
                        }
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

extension ProductsScreen {
    static func build(items: [Product]) -> some View {
        let vm = ProductsVM(
                dataManager: DataManager.build(),
                requester: AsyncMan()
        )
        return ProductsScreen(vm: vm, items: items)
    }
}
