//
//  Challenge.swift
//  BigAdventure
//
//  Created by 洪立德 on 2019/6/25.
//  Copyright © 2019 洪立德. All rights reserved.
//

import Foundation

class LoadingChallenge {

    static var whenList: [AdventureWhen]?
    static var whereList: [AdventureWhere]?
    static var whatList: [AdventureWhat]?

    static func getChallengeWhen() {

        var url: URL {

            return Bundle.main.url(forResource: "when", withExtension: "json")!
        }

        let task = URLSession.shared.dataTask(with: url) { (data, res, err) in

            do {
                let decoder = JSONDecoder()
                let list = try decoder.decode([AdventureWhen].self, from: data!)

                self.whenList = list
                print("success: \(list)")
                print("response: \(String(describing: res))")
            } catch {
                print("parse error: \(String(describing: err))")
            }
        }
        task.resume()
    }

    static func getChallengeWhere() {

        var url: URL {

            return Bundle.main.url(forResource: "where", withExtension: "json")!
        }

        let task = URLSession.shared.dataTask(with: url) { (data, res, err) in

            do {
                let decoder = JSONDecoder()
                let list = try decoder.decode([AdventureWhere].self, from: data!)

                self.whereList = list
                print("success: \(list)")
                print("response: \(String(describing: res))")
            } catch {
                print("parse error: \(String(describing: err))")
            }
        }
        task.resume()
    }

    static func getChallengeWhat() {

        var url: URL {

            return Bundle.main.url(forResource: "what", withExtension: "json")!
        }

        let task = URLSession.shared.dataTask(with: url) { (data, res, err) in

            do {
                let decoder = JSONDecoder()
                let list = try decoder.decode([AdventureWhat].self, from: data!)

                self.whatList = list
                print("success: \(list)")
                print("response: \(String(describing: res))")
            } catch {
                print("parse error: \(String(describing: err))")
            }
        }
        task.resume()
    }
}
