//
//  PatternAuthentication.swift
//  AlphaProjectAuth
//
//  Created by devming on 2020/02/05.
//  Copyright © 2020 devming. All rights reserved.
//

import UIKit

class ZumPatternLockView: UIView {
    
    var patternLockView: PatternLockView!
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        
        patternLockView = PatternLockView(config: PatternConfig())
        addSubview(patternLockView)
        attatchToParentView(view: patternLockView)
        
    }
    
    func attatchToParentView(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 30).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 30).isActive = true
    }
}
