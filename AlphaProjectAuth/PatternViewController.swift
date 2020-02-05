//
//  PatternViewController.swift
//  AlphaProjectAuth
//
//  Created by devming on 2020/02/05.
//  Copyright © 2020 devming. All rights reserved.
//

import UIKit

class PatternViewController: UIViewController {
    @IBOutlet weak var patternView: ZumPatternLockView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        patternView.delegate = self
    }
}

//extension PatternViewController: AuthenticationDelegate {
//    var isRegistered: Bool {
//        return true
//    }
//    
//    func register() {
//            
//    }
//    
//    func login() {
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//    
//}
