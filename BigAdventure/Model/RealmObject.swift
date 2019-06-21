//
//  RealmObject.swift
//  BigAdventure
//
//  Created by 洪立德 on 2019/6/20.
//  Copyright © 2019 洪立德. All rights reserved.
//

import Foundation
import RealmSwift

class RealmObject: Object {

  // 什麼時候
  @objc dynamic var when: String?
  // 在哪裡
  @objc dynamic var atWhere: String?
  // 做什麼
  @objc dynamic var doWhat: String?
  // 開始時間
  @objc dynamic var startDate: Date?
  // 完成時間
  @objc dynamic var finishDate: Date?
}
