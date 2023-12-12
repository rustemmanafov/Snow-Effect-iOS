//
//  SnowEffectManager.swift
//  SnowEffectAnimation
//
//  Created by Rustam Manafli on 05.12.23.
//

import UIKit

internal struct SnowEffectManager {

    fileprivate let snowLayer = CAEmitterLayer()
    
    fileprivate lazy var snowCell: CAEmitterCell = {
        let snowCell = CAEmitterCell()
        snowCell.contents = UIImage(named: "snowFlake")?.cgImage
        snowCell.scale = 0.06
        snowCell.scaleRange = 0.3
        snowCell.emissionRange = .pi
        snowCell.lifetime = 20.0
        snowCell.birthRate = 40
        snowCell.velocity = -30
        snowCell.velocityRange = -20
        snowCell.yAcceleration = 30
        snowCell.xAcceleration = 5
        snowCell.spin = -0.5
        snowCell.spinRange = 1.0
        return snowCell
    }()

    mutating func injectSnowLayer(into view: UIView) {
        snowLayer.emitterPosition = CGPoint(x: view.bounds.width / 2.0, y: -50)
        snowLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        snowLayer.emitterShape = CAEmitterLayerEmitterShape.line
        snowLayer.beginTime = CACurrentMediaTime()
        snowLayer.timeOffset = CFTimeInterval(arc4random_uniform(6) + 5)
        snowLayer.emitterCells = [snowCell]

        view.layer.addSublayer(snowLayer)
    }

    func removeFlake() {
        snowLayer.removeFromSuperlayer()
    }

}
