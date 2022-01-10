//
//  AppBottomSheet.swift
//  BootStrap
//
//  Created by Shaban Kamel on 11/27/20.
//  Copyright © 2020 generation-c. All rights reserved.
//

import SwiftUI

public struct AppBottomSheet<Content: View>: View {

    private var dragToDismissThreshold: CGFloat {
        height * 0.2
    }
    private var grayBackgroundOpacity: Double {
        isPresented ? (0.4 - Double(draggedOffset) / 600) : 0
    }

    @State private var draggedOffset: CGFloat = 0
    @State private var previousDragValue: DragGesture.Value?

    @Binding var isPresented: Bool
    private let height: CGFloat
    private let topBarHeight: CGFloat
    private let topBarCornerRadius: CGFloat
    private let content: Content
    private let contentBackgroundColor: Color
    private let topBarBackgroundColor: Color
    private let showTopIndicator: Bool
    private let overClear: Bool

    public init(
            isPresented: Binding<Bool>,
            height: CGFloat,
            topBarHeight: CGFloat = 30,
            topBarCornerRadius: CGFloat? = nil,
            topBarBackgroundColor: Color = Color(.systemBackground),
            contentBackgroundColor: Color = Color(.systemBackground),
            overClear: Bool,
            showTopIndicator: Bool,
            @ViewBuilder content: () -> Content
    ) {
        self.topBarBackgroundColor = topBarBackgroundColor
        self.contentBackgroundColor = contentBackgroundColor
        self._isPresented = isPresented
        self.height = height
        self.topBarHeight = topBarHeight
        if let topBarCornerRadius = topBarCornerRadius {
            self.topBarCornerRadius = topBarCornerRadius
        } else {
            self.topBarCornerRadius = topBarHeight / 3
        }
        self.overClear = overClear
        self.showTopIndicator = showTopIndicator
        self.content = content()
    }

    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                fullScreenLightGrayOverlay()
                VStack(spacing: 0) {
                    topBar(geometry: geometry)
                    VStack(spacing: -8) {
                        Spacer()
                        content.padding(.bottom, geometry.safeAreaInsets.bottom)
                        Spacer()
                    }
                }
                        .frame(height: height - min(draggedOffset * 2, 0))
                        .background(contentBackgroundColor)
                        .cornerRadius(radius: topBarCornerRadius, corners: [.topLeft, .topRight])
                        .shadow(color: overClear ? Color(UIColor(white: 232 / 255, alpha: 0.75)) : .clear, radius: 5, x: 0, y: -8)
                        .animation(.interactiveSpring())
                        .offset(y: isPresented ? (geometry.size.height / 2 - height / 2 + geometry.safeAreaInsets.bottom + draggedOffset) : (geometry.size.height / 2 + height / 2 + geometry.safeAreaInsets.bottom))
            }
        }
    }

    fileprivate func fullScreenLightGrayOverlay() -> some View {
        Color
                .black
                .opacity(overClear ? 0 : grayBackgroundOpacity)
                .edgesIgnoringSafeArea(.all)
                .animation(.interactiveSpring())
                .onTapGesture {
                    self.isPresented = false
                }
    }

    fileprivate func topBar(geometry: GeometryProxy) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                    .fill(Color.secondary)
                    .frame(width: 40, height: 6)
                    .opacity(showTopIndicator ? 1 : 0)
        }
                .frame(width: geometry.size.width, height: topBarHeight)
                .background(topBarBackgroundColor)
                .gesture(
                        DragGesture()
                                .onChanged({ (value) in

                                    let offsetY = value.translation.height
                                    self.draggedOffset = offsetY

                                    if let previousValue = previousDragValue {
                                        let previousOffsetY = previousValue.translation.height
                                        let timeDiff = Double(value.time.timeIntervalSince(previousValue.time))
                                        let heightDiff = Double(offsetY - previousOffsetY)
                                        let velocityY = heightDiff / timeDiff
                                        if velocityY > 1400 {
                                            self.isPresented = false
                                            return
                                        }
                                    }
                                    self.previousDragValue = value

                                })
                                .onEnded({ (value) in
                                    let offsetY = value.translation.height
                                    if offsetY > dragToDismissThreshold {
                                        self.isPresented = false
                                    }
                                    self.draggedOffset = 0
                                })
                )
    }
}

