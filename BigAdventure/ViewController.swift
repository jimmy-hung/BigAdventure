//
//  ViewController.swift
//  BigAdventure
//
//  Created by 洪立德 on 2019/6/19.
//  Copyright © 2019 洪立德. All rights reserved.
//

import UIKit
import SnapKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
  @IBOutlet weak var loginButton: GIDSignInButton!
  var enterButton = UIButton()
  var isLogin = false {
    didSet {
      if isLogin {
        addEnterButton()
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    GIDSignIn.sharedInstance()?.uiDelegate = self
    GIDSignIn.sharedInstance()?.delegate = self
  }

  func addEnterButton () {

    view.addSubview(enterButton)
    enterButton.snp.makeConstraints({ (make) in
      make.width.equalTo(150)
      make.height.equalTo(80)
      make.centerX.equalTo(UIScreen.main.bounds.maxX / 2)
      make.centerY.equalTo(UIScreen.main.bounds.maxY * 2 / 3)
    })
    enterButton.layer.cornerRadius = 10
    enterButton.backgroundColor = .darkGray
    enterButton.setTitle("click", for: .normal)

    enterButton.addTarget(self, action: #selector(clickEnterButton), for: .touchUpInside)
  }

  @objc func clickEnterButton () {

    let secVC = storyboard?.instantiateViewController(withIdentifier: "tabVC") as? UITabBarController
    present(secVC!, animated: false, completion: nil)
  }

  // login 成功後觸發
  func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
    if error != nil {
      print("Login google err: \(String(describing: error))")
    } else {
      print("user name: \(String(describing: user.userID)))")
      print("user mail: \(String(describing: user.profile.email))")
      print("user photo: \(String(describing: user.profile.imageURL(withDimension: 400)))")

      isLogin = true
      DispatchQueue.main.async {
        self.loginButton.isHidden = true
        self.loginButton = nil
      }
    }
  }
}
