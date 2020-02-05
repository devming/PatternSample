////
////  PatternAuthentication.swift
////  AlphaProjectAuth
////
////  Created by devming on 2020/02/05.
////  Copyright © 2020 devming. All rights reserved.
////
//
//import UIKit
////import CCGestureLock
//
//class PatternAuthenticationView: UIView {
//    
//    var patternLockView: CCGestureLock!
//    var delegate: AuthenticationDelegate? = nil
//    
//    private enum LockMode {
//        
//        case unlocked
//        case locked
//    }
//    private var lockMode : LockMode {
//        get {
//            return Password.lockSequence == nil ? .unlocked : .locked
//        }
//    }
//        
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setup()
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//    
//    func setup() {
//        
//        patternLockView = CCGestureLock(frame: self.frame)
//        addSubview(patternLockView)
//        attatchToParentView(view: patternLockView)
//        
//        // Set number of sensors
//        patternLockView.lockSize = (3, 3)
//        
//        // Sensor grid customisations
//        patternLockView.edgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
//        
//        // Sensor point customisation (normal)
//        patternLockView.setSensorAppearance(
//            type: .defaultRing,
//            radius: 5,
//            width: 1,
//            color: .white,
//            forState: .normal
//        )
//        patternLockView.setSensorAppearance(
//            type: .maxRing,
//            radius: 30,
//            width: 3,
//            color: .clear,
//            forState: .normal
//        )
//        
//        // Sensor point customisation (selected)
//        patternLockView.setSensorAppearance(
//            type: .defaultRing,
//            radius: 3,
//            width: 5,
//            color: .white,
//            forState: .selected
//        )
//        patternLockView.setSensorAppearance(
//            type: .maxRing,
//            radius: 30,
//            width: 3,
//            color: .clear,
//            forState: .selected
//        )
//        
//        // Sensor point customisation (wrong password)
//        patternLockView.setSensorAppearance(
//            type: .defaultRing,
//            radius: 3,
//            width: 5,
//            color: .red,
//            forState: .error
//        )
//        patternLockView.setSensorAppearance(
//            type: .maxRing,
//            radius: 30,
//            width: 3,
//            color: .clear,
//            forState: .error
//        )
//        
//        // Line connecting sensor points (normal/selected)
//        [CCGestureLock.GestureLockState.normal, CCGestureLock.GestureLockState.selected].forEach { (state) in
//            patternLockView.setLineAppearance(
//                width: 5.5,
//                color: UIColor.white.withAlphaComponent(0.5),
//                forState: state
//            )
//        }
//        
//        // Line connection sensor points (wrong password)
//        patternLockView.setLineAppearance(
//            width: 5.5,
//            color: UIColor.red.withAlphaComponent(0.5),
//            forState: .error
//        )
//        
//        patternLockView.addTarget(
//            self,
//            action: #selector(gestureComplete),
//            for: .gestureComplete
//        )
//    }
//    
//    func attatchToParentView(view: UIView) {
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//    }
//    
//    @objc func gestureComplete(gestureLock: CCGestureLock) {
//        
//        if lockMode == .locked {
//            
//            if Password.lockSequence! == gestureLock.lockSequence {
//                
//                Password.lockSequence = nil
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
////                    self.dismiss(animated: true, completion: nil)
//                    print("Dismiss")
//                    self.delegate?.login()
//                })
//            } else {
//                
//                gestureLock.gestureLockState = .error
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
//                    gestureLock.gestureLockState = .normal
//                })
//            }
//            
//        } else {
////            enableButtons(true)
//            print("enableButtons(true)")
//        }
//    }
//}
