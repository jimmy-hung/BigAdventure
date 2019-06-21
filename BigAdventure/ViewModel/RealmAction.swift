//
//  RealmAction.swift
//  BigAdventure
//
//  Created by 洪立德 on 2019/6/20.
//  Copyright © 2019 洪立德. All rights reserved.
//

import Foundation
import RealmSwift

class RealmAction: NSObject {

  let realmDatabase = try? Realm()

  // 寫入資料
  func writeInRealm (data: RealmObject) {
    try? realmDatabase?.write {
      realmDatabase?.add(data)
    }
  }

  // 刪除資料
  func deleteRealm (data: RealmObject) {
    try? realmDatabase?.write {
      realmDatabase?.delete(data)
    }
  }

  // 刪除資料所有
  func cleanUp () {
    try? realmDatabase?.write {
      realmDatabase?.deleteAll()
    }
  }
}
