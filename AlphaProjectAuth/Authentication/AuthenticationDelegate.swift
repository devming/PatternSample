//
//  AuthenticationDelegate.swift
//  AlphaProjectAuth
//
//  Created by devming on 2020/02/04.
//  Copyright © 2020 devming. All rights reserved.
//

protocol AuthenticationDelegate {
    var isRegistered: Bool { get }
    
    func register()
    func login()
}
