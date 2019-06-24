//
//  ChallengeViewController.swift
//  BigAdventure
//
//  Created by 洪立德 on 2019/6/21.
//  Copyright © 2019 洪立德. All rights reserved.
//

import UIKit

class ChallengeViewController: UIViewController {

    var whenList: [AdventureWhen]?
    var whereList: [AdventureWhere]?
    var whatList: [AdventureWhat]?

    override func viewDidLoad() {
        super.viewDidLoad()

        getChallengeWhen()
        getChallengeWhere()
        getChallengeWhat()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("here")
    }

    func getChallengeWhen() {

        var url: URL {

            return Bundle.main.url(forResource: "when", withExtension: "json")!
        }

        let task = URLSession.shared.dataTask(with: url) { (data, res, err) in

            do {
                let decoder = JSONDecoder()
                let list = try decoder.decode([AdventureWhen].self, from: data!)

                self.whenList = list
                print("success: \(list)")
            } catch {
                print("parse error: \(String(describing: err))")
            }
        }
        task.resume()
    }

    func getChallengeWhere() {

        var url: URL {

            return Bundle.main.url(forResource: "where", withExtension: "json")!
        }

        let task = URLSession.shared.dataTask(with: url) { (data, res, err) in

            do {
                let decoder = JSONDecoder()
                let list = try decoder.decode([AdventureWhere].self, from: data!)

                self.whereList = list
                print("success: \(list)")
            } catch {
                print("parse error: \(String(describing: err))")
            }
        }
        task.resume()
    }

    func getChallengeWhat() {

        var url: URL {

            return Bundle.main.url(forResource: "what", withExtension: "json")!
        }

        let task = URLSession.shared.dataTask(with: url) { (data, res, err) in

            do {
                let decoder = JSONDecoder()
                let list = try decoder.decode([AdventureWhat].self, from: data!)

                self.whatList = list
                print("success: \(list)")
            } catch {
                print("parse error: \(String(describing: err))")
            }
        }
        task.resume()
    }
}
