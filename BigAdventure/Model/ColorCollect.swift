//
//  ColorCollect.swift
//  BigAdventure
//
//  Created by 洪立德 on 2019/6/24.
//  Copyright © 2019 洪立德. All rights reserved.
//

import Foundation
import UIKit

struct ColorCollect {

    static var collectColor: [UIColor] = [.red, .blue,
                                          .skyBlue, .veryLightGray,
                                          .green, .purple, .yellow,
                                          .pink, .sandBrown,
                                          .cyan, .darkBlue,
                                          .groupTableViewBackground, .magenta]
    static var countColor: Int = ColorCollect.collectColor.count
}
