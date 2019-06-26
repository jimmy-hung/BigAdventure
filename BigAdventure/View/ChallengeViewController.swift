//
//  ChallengeViewController.swift
//  BigAdventure
//
//  Created by 洪立德 on 2019/6/21.
//  Copyright © 2019 洪立德. All rights reserved.
//

import UIKit
import SnapKit

class ChallengeViewController: UIViewController {

    @IBOutlet var whenTime: [UIButton]!
    @IBOutlet var wherePlace: [UIButton]!
    @IBOutlet var whatPlay: [UIButton]!

    var whenLabel: UILabel?
    var whereLabel: UILabel?
    var whatLabel: UILabel?
    var viewModel = ViewModel()

    var finishButton: UIButton?
    var finishLabel: UILabel?

    var pressWhen = false
    var pressWhere = false
    var pressWhat = false

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
        whenLabel!.text = viewModel.getWhen()
        view.addSubview(whenLabel!)

        pressWhen = true
        checkIsPressed ()
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
        whereLabel!.text = viewModel.getWhere()
        view.addSubview(whereLabel!)

        pressWhere = true
        checkIsPressed ()
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
        whatLabel!.text = viewModel.getWhat()
        view.addSubview(whatLabel!)

        pressWhat = true
        checkIsPressed ()
    }

    func checkIsPressed () {

        if pressWhen,
           pressWhere,
           pressWhat {
            settingFinishLabel ()
            finishButton = UIButton()
            view.addSubview(finishButton!)
            finishButton?.snp.makeConstraints({ (make) in
                make.width.equalTo(100)
                make.height.equalTo(50)
                make.centerX.equalTo(UIScreen.main.bounds.width * 2 / 3)
                make.centerY.equalTo(UIScreen.main.bounds.height * 6.8 / 8)
            })
            finishButton?.setTitle("是的,已完成", for: .normal)
            finishButton?.layer.cornerRadius = 15
            finishButton?.alpha = 0.5
            finishButton?.backgroundColor = .skyBlue
            finishButton?.addTarget(self, action: #selector(checkFinish), for: .touchUpInside)
        }
    }

    @objc func checkFinish () {
        finishButton?.alpha = 1
        print("haha")
    }

    func settingFinishLabel () {

        finishLabel = UILabel()
        view.addSubview(finishLabel!)

        finishLabel?.snp.makeConstraints({ (make) in
            make.width.equalTo(150)
            make.height.equalTo(50)
            make.centerX.equalTo(UIScreen.main.bounds.width * 1 / 3)
            make.centerY.equalTo(UIScreen.main.bounds.height * 6.8 / 8)
        })
        finishLabel?.textAlignment = .center
        finishLabel?.text = "是否已完成跳戰 ?"
        finishLabel?.textColor = .black
    }

    func giveRandomColor () {

        whenTime[0].backgroundColor = randomSettingColor()
        whenTime[1].backgroundColor = randomSettingColor()
        whenTime[0].layer.cornerRadius = CGFloat(30.arc4random)
        whenTime[1].layer.cornerRadius = CGFloat(30.arc4random)

        wherePlace[0].backgroundColor = randomSettingColor()
        wherePlace[1].backgroundColor = randomSettingColor()
        wherePlace[0].layer.cornerRadius = CGFloat(30.arc4random)
        wherePlace[1].layer.cornerRadius = CGFloat(30.arc4random)

        whatPlay[0].backgroundColor = randomSettingColor()
        whatPlay[1].backgroundColor = randomSettingColor()
        whatPlay[0].layer.cornerRadius = CGFloat(30.arc4random)
        whatPlay[1].layer.cornerRadius = CGFloat(30.arc4random)
    }

    func randomSettingColor() -> UIColor {

        return ColorCollect.collectColor[ColorCollect.countColor.arc4random]
    }

    func resetGame () {

        pressWhen = false
        pressWhere = false
        pressWhat = false

        whenLabel?.removeFromSuperview()
        whereLabel?.removeFromSuperview()
        whatLabel?.removeFromSuperview()
        finishButton?.removeFromSuperview()

        whenLabel = nil
        whereLabel = nil
        whatLabel = nil
        finishButton = nil

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
