//
// Created by Shaban on 17/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI


// TODO: localize
public struct BackButtonView: View {
    let action: () -> Void

    public init(action: @escaping () -> ()) {
        self.action = action
    }

    public var body: some View {
        HStack {
            Spacer().frame(maxWidth: .infinity)

            Button(action: action) {
                HStack(alignment: .center) {
                    Image(systemName: "lessthan")
                            .resizable()
                            .frame(width: 10, height: 15)

                    Text("Back")
                            .foregroundColor(Color(Colors.darkCloud.color))
                }

            }.frame(width: 125, height: 60)
                    .cardView()

            Spacer().frame(width: UserInterface.isIPhone() ? 20 : 118)
        }
    }
}
