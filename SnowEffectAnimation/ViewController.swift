//
//  ViewController.swift
//  SnowEffectAnimation
//
//  Created by Rustam Manafli on 05.12.23.
//

import UIKit

class ViewController: UIViewController {
    
    var snowEffectManager = SnowEffectManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startSnowAnimation()
        
       // snowEffectManager.injectSnowLayer(into: self.view)
    }
    
    func removeSnowEffect() {
        snowEffectManager.removeFlake()
    }

    private func startSnowAnimation() {
        let flakeEmitterCell = CAEmitterCell()
        
                flakeEmitterCell.contents = UIImage(named: "snowFlake")?.cgImage
                flakeEmitterCell.scale = 0.06
                flakeEmitterCell.scaleRange = 0.3
                flakeEmitterCell.emissionRange = .pi
                flakeEmitterCell.lifetime = 20.0
                flakeEmitterCell.birthRate = 40
                flakeEmitterCell.velocity = -30
                flakeEmitterCell.velocityRange = -20
                flakeEmitterCell.yAcceleration = 30
                flakeEmitterCell.xAcceleration = 5
                flakeEmitterCell.spin = -0.5
                flakeEmitterCell.spinRange = 1.0

                let snowEmitterLayer = CAEmitterLayer()
                snowEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2.0, y: -50)
                snowEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
                snowEmitterLayer.emitterShape = CAEmitterLayerEmitterShape.line
                snowEmitterLayer.beginTime = CACurrentMediaTime()
                snowEmitterLayer.timeOffset = 10
                snowEmitterLayer.emitterCells = [flakeEmitterCell]

                view.layer.addSublayer(snowEmitterLayer)
    }

}

