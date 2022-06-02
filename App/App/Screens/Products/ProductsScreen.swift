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
    @State var navigationOption: NavigationOption = .push

    var bodyContent: some View {
        VStack {
            NavigationOptionsView()
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
                .navigationBarTitle("Catalog", displayMode: .inline)
                .navigationBarHidden(true)
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
            Text("No Products To Display")
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
                        type: selectedNavigationType) {
                    // When this view is clicked, it will trigger the navigation
                    ProductItemView(item: item)
                }.buttonStyle(PlainButtonStyle())

                // It's also possible to use Navigator object directly to navigate
                if false {
                    ProductItemView(item: item).onTapGesture {
                        navigator.navigate(type: selectedNavigationType) {
                            ProductDetailScreen.build(item: item)
                        }
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
    }

    private var selectedNavigationType: NavigationType {
        switch navigationOption {
        case .push:
            return .push(addToBackStack: true)
        case .sheet:
            return .sheet()
        case .fullSheet:
            if #available(iOS 14, *) {
                return .fullSheet
            }
            return .sheet()
        }
    }
}

extension ProductsScreen {
    private func NavigationOptionsView() -> some View {
        ChipGroup(
                items: navigationOptions,
                selectedItems: $selectedNavigationOptions
        ) { item in
            navigationOption = .from(item.id)
        }
    }

    private var navigationOptions: [ChipGroup.Item] {
        [
            ChipGroup.Item(id: NavigationOption.push.rawValue, name: "Push"),
            ChipGroup.Item(id: NavigationOption.sheet.rawValue, name: "Sheet"),
            ChipGroup.Item(id: NavigationOption.fullSheet.rawValue, name: "Full Sheet")
        ]
    }

    enum NavigationOption: String {
        case push = "1"
        case sheet = "2"
        case fullSheet = "3"

        static func from(_ value: String) -> NavigationOption {
            NavigationOption(rawValue: value) ?? .push
        }
    }
}

extension ProductsScreen {
    static func build(items: [Product]) -> some View {
        let vm = ProductsVM(
                dataManager: DataManager.build(),
                requester: CombineRequester()
        )
        return ProductsScreen(vm: vm, items: items)
    }
}
