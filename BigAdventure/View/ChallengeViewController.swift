//
//  ChallengeViewController.swift
//  BigAdventure
//
//  Created by 洪立德 on 2019/6/21.
//  Copyright © 2019 洪立德. All rights reserved.
//

import UIKit

class ChallengeViewController: UIViewController {

    @IBOutlet var whenTime: [UIButton]!
    @IBOutlet var wherePlace: [UIButton]!
    @IBOutlet var whatPlay: [UIButton]!

    var whenLabel: UILabel?
    var whereLabel: UILabel?
    var whatLabel: UILabel?
    var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        giveRandomColor ()
        resetGame()
    }

    @IBAction func whenButton(_ sender: UIButton) {

        DispatchQueue.main.async {
            self.whenTime[0].isHidden = true
            self.whenTime[1].isHidden = true
        }

        let vframe = UIScreen.main.bounds
        whenLabel = UILabel()
        whenLabel!.frame = CGRect(x: 0, y: vframe.height / 5, width: vframe.width, height: vframe.height / 8)
        whenLabel!.font = .systemFont(ofSize: 30, weight: .bold)
        whenLabel!.textAlignment = .center
        whenLabel!.textColor = .red
        whenLabel!.text = "\(LoadingChallenge.whenList![(LoadingChallenge.whenList?.count.arc4random)!].when)"
        view.addSubview(whenLabel!)
    }

    @IBAction func whereButton(_ sender: UIButton) {

        DispatchQueue.main.async {
            self.wherePlace[0].isHidden = true
            self.wherePlace[1].isHidden = true
        }

        let vframe = UIScreen.main.bounds
        whereLabel = UILabel()
        whereLabel!.frame = CGRect(x: 0, y: vframe.height / 2.2, width: vframe.width, height: vframe.height / 8)
        whereLabel!.font = .systemFont(ofSize: 30, weight: .bold)
        whereLabel!.textAlignment = .center
        whereLabel!.textColor = .red
        whereLabel!.text = "\(LoadingChallenge.whereList![(LoadingChallenge.whereList?.count.arc4random)!].atWhere)"
        view.addSubview(whereLabel!)
    }

    @IBAction func whatButton(_ sender: UIButton) {

        DispatchQueue.main.async {
            self.whatPlay[0].isHidden = true
            self.whatPlay[1].isHidden = true
        }

        let vframe = UIScreen.main.bounds
        whatLabel = UILabel()
        whatLabel!.frame = CGRect(x: 0, y: vframe.height / 1.4, width: vframe.width, height: vframe.height / 8)
        whatLabel!.font = .systemFont(ofSize: 30, weight: .bold)
        whatLabel!.textAlignment = .center
        whatLabel!.textColor = .red
        whatLabel!.text = "\(LoadingChallenge.whatList![(LoadingChallenge.whatList?.count.arc4random)!].doWhat)"
        view.addSubview(whatLabel!)
    }

    func giveRandomColor () {

        whenTime[0].backgroundColor = randomSettingColor()
        whenTime[1].backgroundColor = randomSettingColor()
        whenTime[0].layer.cornerRadius = 20
        whenTime[1].layer.cornerRadius = 20

        wherePlace[0].backgroundColor = randomSettingColor()
        wherePlace[1].backgroundColor = randomSettingColor()
        wherePlace[0].layer.cornerRadius = 20
        wherePlace[1].layer.cornerRadius = 20

        whatPlay[0].backgroundColor = randomSettingColor()
        whatPlay[1].backgroundColor = randomSettingColor()
        whatPlay[0].layer.cornerRadius = 20
        whatPlay[1].layer.cornerRadius = 20
    }

    func randomSettingColor() -> UIColor {

        return ColorCollect.collectColor[ColorCollect.countColor.arc4random]
    }

    func resetGame () {

        whenLabel?.removeFromSuperview()
        whereLabel?.removeFromSuperview()
        whatLabel?.removeFromSuperview()

        whenLabel = nil
        whereLabel = nil
        whatLabel = nil

        DispatchQueue.main.async {
                self.whenTime[0].isHidden = false
                self.whenTime[1].isHidden = false
                self.wherePlace[0].isHidden = false
                self.wherePlace[1].isHidden = false
                self.whatPlay[0].isHidden = false
                self.whatPlay[1].isHidden = false
        }

    }
}
