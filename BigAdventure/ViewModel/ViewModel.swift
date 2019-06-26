//
//  ViewModel.swift
//  BigAdventure
//
//  Created by 洪立德 on 2019/6/25.
//  Copyright © 2019 洪立德. All rights reserved.
//

import Foundation

class ViewModel: NSObject {

    func getWhen () -> String {

        return "\(LoadingChallenge.whenList![(LoadingChallenge.whenList?.count.arc4random)!].when)"
    }

    func getWhere () -> String {

        return "\(LoadingChallenge.whereList![(LoadingChallenge.whereList?.count.arc4random)!].atWhere)"
    }

    func getWhat () -> String {

        return "\(LoadingChallenge.whatList![(LoadingChallenge.whatList?.count.arc4random)!].doWhat)"
    }

}
