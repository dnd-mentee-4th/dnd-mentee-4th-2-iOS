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
    private var imageView = UIImageView()
        .then {
            $0.image = UIImage(named: "ic_quiz")
            $0.contentMode = .scaleToFill
            $0.layer.shadowColor = UIColor(named: "textPink")?.cgColor
            $0.layer.shadowOffset = CGSize(width: 2, height: 2)
            $0.layer.shadowOpacity = 0.3
            $0.layer.shadowRadius = 4
        }
    private var frameWidth: CGFloat!
    private var frameHeight: CGFloat!
    
    var progressColor = UIColor(named: "peachyPinkTwo")! {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    var trackColor = UIColor(displayP3Red: 239/255, green: 239/255, blue: 239/255, alpha: 1) {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
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
        setupImageView()
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
        trackLayer.fillColor = UIColor.white.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = 3.0
        trackLayer.strokeEnd = 1.0
        layer.addSublayer(trackLayer)
    }
    
    func makeProgressLayer(_ circlePath: UIBezierPath) {
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = 3.0
        progressLayer.strokeEnd = 0.0
        layer.addSublayer(progressLayer)
    }
    
    func setupImageView() {
        self.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 22).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: frameWidth/2).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: frameHeight/2).isActive = true
    }
}
