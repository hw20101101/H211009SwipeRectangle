//
//  RectView.swift
//  H211009SwipeRectangle
//
//  Created by houwei2021 on 2021/10/10.
//


import UIKit
import Foundation

class RectView: UIView {
    var startPoint: CGPoint? {
        didSet {
            setNeedsDisplay()
        }
    }

    var endPoint: CGPoint? {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        guard let startPoint = startPoint, let endPoint = endPoint else {
            return
        }

        let path = UIBezierPath(
            rect: CGRect(
                x: min(startPoint.x, endPoint.x),
                y: min(startPoint.y, endPoint.y),
                width: abs(startPoint.x - endPoint.x),
                height: abs(startPoint.y - endPoint.y)
            )
        )
        path.stroke()
    }
}
