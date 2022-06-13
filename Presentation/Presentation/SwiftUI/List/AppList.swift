//
// Created by Shaban on 17/05/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import SwiftUI

public struct AppList<Content: View, Item: Identifiable>: View {
    private let items: [Item]
    private let content: (Item) -> Content
    private let cellBottomPadding: CGFloat

    public init(
            _ items: [Item],
            cellBottomPadding: CGFloat = 10,
            @ViewBuilder content: @escaping (Item) -> Content) {
        self.items = items
        self.cellBottomPadding = cellBottomPadding
        self.content = content
    }

    public var body: some View {
        Group {
            if items.isEmpty {
                EmptyView()
            } else {
                ListView()
            }
        }
    }

    private func ListView() -> some View {
        List {
            ForEach(items) { item in
                content(item)
                        .padding(.bottom, cellBottomPadding)
                        .removeListSeparator()
            }
        }
                .listStyle(PlainListStyle())
    }
}
