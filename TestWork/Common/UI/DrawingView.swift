//
//  DrawingView.swift
//  TestWork
//
//  Created by Pavel Vaskou on 18.09.23.
//

import Foundation
import UIKit
import SnapKit

class DrawingView: UIView {
    required init?(coder: NSCoder) { fatalError() }

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    func setImage(image: UIImage?) {
        imageView.image = image
    }

    func undo() {
        if !paths.isEmpty {
            paths.removeLast()
            updateDrawingOverlay()
        }
    }

    private func setupUI() {
        clipsToBounds = true
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        layer.addSublayer(drawingLayer)
    }

    func updateDrawingOverlay() {
        let combinedPath = CGMutablePath()
        for path in paths {
            combinedPath.addPath(path.cgPath)
        }

        combinedPath.addPath(currentPath.cgPath)

        drawingLayer.frame = imageView.frame
        drawingLayer.path = combinedPath
        drawingLayer.lineWidth = 5
        drawingLayer.strokeColor = UIColor.red.cgColor
        drawingLayer.fillColor = UIColor.clear.cgColor

        setNeedsDisplay()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            touchPoint = touch.location(in: self)
            currentPath = UIBezierPath()
            currentPath.lineWidth = 5.0
            currentPath.lineCapStyle = .round
            currentPath.lineJoinStyle = .round
            currentPath.move(to: touchPoint ?? CGPoint.zero)        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self)
            currentPath.addLine(to: currentPoint)
            touchPoint = currentPoint
            updateDrawingOverlay()
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        paths.append(currentPath)
        updateDrawingOverlay()
        currentPath = UIBezierPath()
    }

    private let drawingLayer = CAShapeLayer()
    private var paths: [UIBezierPath] = []
    private var currentPath = UIBezierPath()
    private var touchPoint: CGPoint?
    private lazy var imageView: UIImageView = UIImageView()
}
