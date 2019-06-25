//
//  extension+RandomInt.swift
//  BigAdventure
//
//  Created by 洪立德 on 2019/6/24.
//  Copyright © 2019 洪立德. All rights reserved.
//

import Foundation

extension Int {
  var arc4random: Int {
    if self > 0 {
      return Int(arc4random_uniform(UInt32(self)))
    } else if self < 0 {
      return Int(arc4random_uniform(UInt32(abs(self))))
    } else {
      return 0
    }
  }
}
