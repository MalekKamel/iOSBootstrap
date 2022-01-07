//
//  Product.swift
//  EcommerceTemplate
//
//  Created by Shaban on 03/01/2022.
//  Copyright © 2022 Shaban. All rights reserved.
//

import Foundation
import SwiftUI

public struct Product {
    public var uuid: String
    public var image: Image
    public var title: String
    public var price: Double
    public var description: String
    public var reviews: [Review]

    public var rating: Double {
        reviews.reduce(0) { res, review in
            res + review.rating
        }
    }
}

public struct Review {
    public var name: String
    public var rating: Double
    public var content: String
}
