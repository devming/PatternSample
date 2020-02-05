//
//  PatternConfig.swift
//  AlphaProjectAuth
//
//  Created by devming on 2020/02/05.
//  Copyright © 2020 devming. All rights reserved.
//

import UIKit

struct PatternConfig: PatternLockViewConfig {
    var matrix: Matrix = Matrix(row: 3, column: 3)
    var gridSize: CGSize = CGSize(width: 35, height: 35)
    var connectLine: ConnectLine?
    var autoMediumGridsConnect: Bool = false
    var connectLineHierarchy: ConnectLineHierarchy = .bottom
    var errorDisplayDuration: TimeInterval = 1
    var initGridClosure: (Matrix) -> (PatternLockGrid)

    init() {
        initGridClosure = {(matrix) -> PatternLockGrid in
            let gridView = GridView()
            let outerFillColorStatus = GridPropertyStatus<UIColor>(normal: nil, connect: .white, error: .red)
            gridView.outerRoundConfig = RoundConfig(radius: 15, lineWidthStatus: nil, lineColorStatus: nil, fillColorStatus: outerFillColorStatus)
            let innerFillColorStatus = GridPropertyStatus<UIColor>(normal: .white, connect: nil, error: nil)
            gridView.innerRoundConfig = RoundConfig(radius: 10, lineWidthStatus: nil, lineColorStatus: nil, fillColorStatus: innerFillColorStatus)
            return gridView
        }
        let lineView = ConnectLineView()
        lineView.lineColorStatus = .init(normal: .white, error: .red)
        lineView.lineWidth = 3
        connectLine = lineView
    }
}
