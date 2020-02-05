//
//  CCGestureLockSensor.swift
//
//  Created by Hsuan-Chih Chuang on 11/04/2017.
//  Copyright (c) 2017 Hsuan-Chih Chuang. All rights reserved.
// 

import UIKit
import Foundation

public class CCGestureLockSensor {
    
    private var appearance: SensorAppearance
    
    
    
    
    // MARK: - Public instance methods & accessors
    var size : CGSize? {
        didSet {
            image = createSensorImage()
        }
    }
    var image : UIImage?
    
    init(appearance: SensorAppearance) {
        self.appearance = appearance
        image = createSensorImage()
    }
    
    func update(type: SensorAppearance.RingType, radius: CGFloat?, width: CGFloat?, color: UIColor?) {
        appearance[type].update(radius: radius, width: width, color: color)
        image = createSensorImage()
    }
    
    
    
    
    // MARK: - Sensor image drawing code
    private func isValid(_ ring: SensorAppearance.RingAppearance) -> Bool {
        return ring.radius > 0.0 && ring.width > 0.0 && !ring.color.isEqual(UIColor.clear)
    }
    
    private func createSensorImage() -> UIImage? {
        
        if let size = self.size {
            
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            if let context = UIGraphicsGetCurrentContext() {
                
                var image: UIImage?
                context.saveGState()
                
                if isValid(appearance.defaultRing) {
                    
//                    if isValid(appearance.outerRing) {
//
//                        appearance.outerRing.radius = min(size.width - appearance.outerRing.width/2.0, appearance.outerRing.radius)
//                        strokeCircleWithRing(appearance.outerRing, context: context, imageSize: size)
//
//                        appearance.innerRing.radius = min(
//                            appearance.outerRing.radius - (appearance.outerRing.width+appearance.innerRing.width)/2.0,
//                            appearance.innerRing.radius
//                        )
//
//                    }
                    strokeCircleWithRing(appearance.defaultRing, context: context, imageSize: size)
                }
                
                context.restoreGState()
                image = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                
                return image;
            }
            
        }
        return nil
    }
    
    private func strokeCircleWithRing(_ ring: SensorAppearance.RingAppearance, context: CGContext, imageSize: CGSize) {
        
        let radius = min(imageSize.width/2.0, ring.radius)
        let rect = CGRect(
            x: imageSize.width/2.0 - radius,
            y: imageSize.height/2.0 - radius,
            width: radius*2,
            height: radius*2)
        
        context.setLineWidth(ring.width)
        context.setStrokeColor(UIColor.systemPink.cgColor)
        context.strokeEllipse(in: rect)
    }
    
    
    
    
    // MARK: - Utility classes
    public class SensorAppearance {
        
        public enum RingType {
            case defaultRing
            case maxRing
        }
        
        class RingAppearance: Appearance {
            
            var radius: CGFloat
            var width : CGFloat
            var color : UIColor
            
            init(radius: CGFloat, width: CGFloat, color: UIColor) {
                self.radius = radius
                self.width = width
                self.color = color
            }
            
            func update(radius: CGFloat?, width: CGFloat?, color: UIColor?) {
                self.radius = radius ?? self.radius
                self.width = width ?? self.width
                self.color = color ?? self.color
            }
        }
        
        var defaultRing: RingAppearance
        var maxRing: RingAppearance
        
        init(defaultRing: RingAppearance, maxRing: RingAppearance) {
            self.defaultRing = defaultRing
            self.maxRing = maxRing
        }
        
        subscript(type: RingType) -> RingAppearance {
            return type == .defaultRing ? defaultRing : maxRing
        }
    }
}
