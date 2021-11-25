//
// Created by Shaban on 30/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public struct SelectionItem: Identifiable, Equatable {
    public let id: String
    public let name: String

    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }

    public static func ==(lhs: SelectionItem, rhs: SelectionItem) -> Bool {
        lhs.id == rhs.id
    }
}

public struct SelectionView: View {
    public var items: [SelectionItem]
    @Binding public var selection: SelectionItem?
    public var axes: Axis.Set
    private var onItemSelected: ((SelectionItem) -> Void)?

    public init(items: [SelectionItem],
                selection: Binding<SelectionItem?>,
                axes: Axis.Set = .horizontal,
                onItemSelected: ((SelectionItem) -> Void)? = nil) {
        self.items = items
        self._selection = selection
        self.axes = axes
        self.onItemSelected = onItemSelected
    }

    public var body: some View {
        ScrollView(axes, showsIndicators: false) {
            switch axes {
            case .vertical:
                VerticalView()

            case .horizontal:
                HorizontalView()
            default:
                VerticalView()
            }
        }
    }

    private func VerticalView() -> some View {
        VStack {
            ForEach(items) { item in
                ItemView(item: item)
            }
        }
    }

    private func HorizontalView() -> some View {
        HStack {
            ForEach(items) { item in
                ItemView(item: item)
            }
        }
    }

    private func ItemView(item: SelectionItem) -> some View {
        let isSelected = selection == item
        return VStack(alignment: .leading) {
            HStack {
                Spacer().frame(maxWidth: .infinity)

                Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .font(.system(size: 15))
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                    .foregroundColor(isSelected ? Color.white : Color(Colors.blueDark.name))
            }

            HStack {
                Text(item.name)
                        .font(.system(size: 16))
                        .foregroundColor(isSelected ? .white : .black)
                        .lineLimit(1)
            }

        }.frame(width: 200)
        .frame(maxWidth: .infinity)
                .padding()
        .background(isSelected ? Color(Colors.blueDark.name) : Color.gray.opacity(0.1))
                .cornerRadius(10)
                .onTapGesture {
                    select(item: item)
                }
    }

    private func select(item: SelectionItem) {
        selection = item
        onItemSelected?(item)
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        let items = [
            SelectionItem(id: "1", name: "Cash"),
            SelectionItem(id: "2", name: "Master Card mmmmmmm"),
            SelectionItem(id: "3", name: "Visa"),
        ]
        return SelectionView(items: items, selection: .constant(items[0]))
    }
}
