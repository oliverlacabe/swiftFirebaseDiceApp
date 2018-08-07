//
//   UIButtonExtension.swift
//  Oli Test
//
//  Created by oliver lacabe on 31/07/2018.
//  Copyright © 2018 oliver lacabe. All rights reserved.
//

import Foundation
import UIKit
extension UIButton {
    func pulsate(
        duration: Double,
        fVal: Double,
        aRev: Bool,
        repeatCount: Float,
        vel: CGFloat,
        damping: CGFloat
        ){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = duration
        pulse.fromValue = fVal
        pulse.autoreverses = aRev
        pulse.repeatCount = repeatCount
        pulse.initialVelocity = vel
        pulse.damping = damping
        
        layer.add(pulse, forKey: nil)
    }
}

