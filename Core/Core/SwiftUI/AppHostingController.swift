//
// Created by Shaban Kamel on 25/08/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

public class AppHostingController<Content> : UIHostingController<Content> where Content : View {
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
}
