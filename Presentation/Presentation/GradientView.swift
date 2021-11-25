//
// Created by mac on 2019-07-02.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    @IBInspectable
    var firstColor: UIColor = UIColor.green {
        didSet {
            updateView()
        }
    }

    @IBInspectable
    var secondColor: UIColor = UIColor.yellow {
        didSet {
            updateView()
        }
    }

    @IBInspectable
    var isHorizontal: Bool = true {
        didSet {
            updateView()
        }
    }

    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }

    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map {$0.cgColor}
        if (isHorizontal) {
            layer.startPoint = CGPoint(x: 0, y: 0.5)
            layer.endPoint = CGPoint (x: 1, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0.5, y: 0)
            layer.endPoint = CGPoint (x: 0.5, y: 1)
        }
    }

}