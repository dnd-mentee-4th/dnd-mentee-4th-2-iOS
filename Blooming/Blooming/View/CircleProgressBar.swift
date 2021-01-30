//
//  CircleProgressBar.swift
//  Blooming
//
//  Created by 김혜빈 on 2021/01/30.
//

import UIKit

class CircleProgressBar: UIView {

    private var progressLayer = CAShapeLayer()
    private var trackLayer = CAShapeLayer()
    private let label = UILabel()
    private var frameWidth: CGFloat!
    private var frameHeight: CGFloat!
    
    var progressColor = UIColor.black {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    var trackColor = UIColor.systemGray {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    var labelSize: CGFloat = 14 {
        didSet {
            label.font = UIFont.boldSystemFont(ofSize: labelSize)
        }
    }
    var labelText: String = "Q" {
        didSet {
            label.text = labelText
        }
    }
    var labelColor = UIColor.black {
        didSet {
            label.textColor = labelColor
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView() {
        frameWidth = frame.size.width
        frameHeight = frame.size.height
        layer.cornerRadius = frameWidth / 2
        
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: frameWidth/2, y: frameHeight/2),
            radius: (frameWidth - 1.5)/2,
            startAngle: CGFloat(-0.5 * .pi),
            endAngle: CGFloat(1.5 * .pi),
            clockwise: true
        )
        
        makeTrackLayer(circlePath)
        makeProgressLayer(circlePath)
        setupLabel()
    }
    
    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        progressLayer.strokeEnd = CGFloat(value)
        progressLayer.add(animation, forKey: "animateprogress")
    }

}

// MARK: +UI
extension CircleProgressBar {
    func makeTrackLayer(_ circlePath: UIBezierPath) {
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = 3.0
        trackLayer.strokeEnd = 1.0
        trackColor = .lightGray
        layer.addSublayer(trackLayer)
    }
    
    func makeProgressLayer(_ circlePath: UIBezierPath) {
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = 3.0
        progressLayer.strokeEnd = 0.0
        progressColor = .black
        layer.addSublayer(progressLayer)
    }
    
    func setupLabel() {
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(displayP3Red: 2/255, green: 188/255, blue: 121/255, alpha: 1)
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: frameWidth/2).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: frameHeight/2).isActive = true
    }
}
