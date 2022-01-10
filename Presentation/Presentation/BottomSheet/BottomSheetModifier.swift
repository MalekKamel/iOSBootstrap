//
//  BottomSheetModifier.swift
//  BootStrap
//
//  Created by Shaban Kamel on 11/27/20.
//  Copyright © 2020 generation-c. All rights reserved.
//

import SwiftUI

public extension View {
    func bottomSheet<Content: View>(
            isPresented: Binding<Bool>,
            height: CGFloat,
            topBarHeight: CGFloat = 30,
            topBarCornerRadius: CGFloat? = 28,
            contentBackgroundColor: Color = Color(.systemBackground),
            topBarBackgroundColor: Color = Color(.systemBackground),
            overClear: Bool = true,
            showTopIndicator: Bool = true,
            @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        ZStack {
            self
            AppBottomSheet(isPresented: isPresented,
                    height: height + UIApplication.shared.bottomAnchor
                            + UIApplication.shared.topAnchor,
                    topBarHeight: topBarHeight,
                    topBarCornerRadius: topBarCornerRadius,
                    topBarBackgroundColor: topBarBackgroundColor,
                    contentBackgroundColor: contentBackgroundColor,
                    overClear: overClear,
                    showTopIndicator: showTopIndicator,
                    content: content)
        }
    }
}
