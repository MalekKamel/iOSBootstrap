//
//  SettingsView.swift
//  EcommerceTemplate
//
//  Created by Shaban on 03/01/2022.
//  Copyright © 2022 Shaban. All rights reserved.
//

import SwiftUI

struct SettingsScreen: AppScreen {
    @ObservedObject var vm: SettingsVM
    @State private var showNotifications = true
    @State private var playSounds = false
    @State private var showAds = false

    var bodyContent: some View {
        VStack {
            Header()
            ItemsView()
        }
    }

    private func Header() -> some View {
        VStack(alignment: .center, spacing: 4) {
            Text("Settings")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
        }.padding(.bottom, 10)
    }

    private func ItemsView() -> some View {
        List {
            Toggle(isOn: $showNotifications) {
                Text("Notifications")
            }
            Toggle(isOn: $playSounds) {
                Text("Sound Alerts")
            }
            Toggle(isOn: $showAds) {
                Text("Show Ads")
            }
        }
    }
}

extension SettingsScreen {
    static func build() -> some View {
        let vm = SettingsVM(
                dataManager: DataManager.build(),
                requester: CombineRequester()
        )
        return SettingsScreen(vm: vm)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen.build()
    }
}
