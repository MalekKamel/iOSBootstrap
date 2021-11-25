//
// Created by Shaban on 23/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

class HostingController<Content>: UIHostingController<Content> where Content: View {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
