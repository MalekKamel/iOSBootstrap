//
// Created by Shaban on 25/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public struct DropdownOption: Hashable {
    public let key: String
    public let value: String

    public init(key: String, value: String) {
        self.key = key
        self.value = value
    }

    public static func ==(lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        lhs.key == rhs.key
    }
}

public struct DropdownRow: View {
    var option: DropdownOption
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    public var body: some View {
        Button(action: {
            if let onOptionSelected = onOptionSelected {
                onOptionSelected(option)
            }
        }) {
            HStack {
                Text(option.value)
                        .font(.system(size: 14))
                        .foregroundColor(Color.black)
                Spacer()
            }
        }
                .padding(.horizontal, 16)
                .padding(.vertical, 5)
    }
}

public struct Dropdown: View {
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(options, id: \.self) { option in
                    DropdownRow(option: option, onOptionSelected: onOptionSelected)
                }
            }
        }
                .frame(minHeight: CGFloat(options.count) * 30, maxHeight: 250)
                .padding(.vertical, 5)
                .background(Color.white)
                .cornerRadius(5)
                .overlay(
                        RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(Colors.blackLight.color), lineWidth: 1)
                )
    }
}

public struct DropdownSelector: View {
    @State private var shouldShowDropdown = false
    @State private var selectedOption: DropdownOption? = nil
    var placeholder: String
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    private let buttonHeight: CGFloat = 60

    public init(placeholder: String, options: [DropdownOption], onOptionSelected: ((DropdownOption) -> ())?) {
        self.placeholder = placeholder
        self.options = options
        self.onOptionSelected = onOptionSelected
    }

    public var body: some View {
        Button(action: {
            guard !options.isEmpty else {
                return
            }
            self.shouldShowDropdown.toggle()
        }) {
            HStack {
                Text(selectedOption == nil ? placeholder : selectedOption!.value)
                        .font(.system(size: 14))
                        .foregroundColor(Color(Colors.darkCloud.color))

                Spacer()

                Image(systemName: shouldShowDropdown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                        .resizable()
                        .frame(width: 9, height: 5)
                        .font(.system(size: 9, weight: .medium))
                        .foregroundColor(Color.black)
            }
        }
                .padding(.horizontal)
                .cornerRadius(5)
                .frame(width: .infinity, height: buttonHeight)
                .overlay(
                        RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(Colors.blackLight.color), lineWidth: 1)
                )
                .overlay(
                        VStack {
                            if shouldShowDropdown {
                                Spacer(minLength: buttonHeight + 10)
                                Dropdown(options: options, onOptionSelected: { option in
                                    shouldShowDropdown = false
                                    selectedOption = option
                                    onOptionSelected?(option)
                                })
                            }
                        }, alignment: .topLeading
                )
                .background(
                        RoundedRectangle(cornerRadius: 5).fill(Color.white)
                )
    }
}

struct DropdownSelector_Previews: PreviewProvider {
    static var uniqueKey: String {
        UUID().uuidString
    }

    static let options: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "Sunday"),
        DropdownOption(key: uniqueKey, value: "Monday"),
        DropdownOption(key: uniqueKey, value: "Tuesday"),
        DropdownOption(key: uniqueKey, value: "Wednesday"),
        DropdownOption(key: uniqueKey, value: "Thursday"),
        DropdownOption(key: uniqueKey, value: "Friday"),
        DropdownOption(key: uniqueKey, value: "Saturday")
    ]


    static var previews: some View {
        Group {
            DropdownSelector(
                    placeholder: "Day of the week",
                    options: options,
                    onOptionSelected: { option in
                        print(option)
                    })
                    .padding(.horizontal)
        }
    }
}
