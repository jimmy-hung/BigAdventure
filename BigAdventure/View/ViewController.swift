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
  var logoutButton = UIButton()
  var originFrame = CGRect()
  var isLogin = false {
    didSet {
      isLoginOrLogout(status: isLogin)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    originFrame = UIScreen.main.bounds
    addEnterButton()
    addLogoutButton()
    GIDSignIn.sharedInstance()?.uiDelegate = self
    GIDSignIn.sharedInstance()?.delegate = self
  }

  func isLoginOrLogout (status: Bool) {

    if status {
      DispatchQueue.main.async {
        self.loginButton.isHidden = true
        self.logoutButton.isHidden = false
        self.enterButton.isHidden = false
      }
    } else {
      DispatchQueue.main.async {
        self.loginButton.isHidden = false
        self.logoutButton.isHidden = true
        self.enterButton.isHidden = true
      }
    }
  }

  func addEnterButton () {

    view.addSubview(enterButton)
    enterButton.snp.makeConstraints({ (make) in
      make.width.equalTo(150)
      make.height.equalTo(80)
      make.centerX.equalTo(originFrame.maxX / 2)
      make.centerY.equalTo(originFrame.maxY * 2 / 3)
    })
    enterButton.layer.cornerRadius = 10
    enterButton.backgroundColor = .darkGray
    enterButton.setTitle("click", for: .normal)

    enterButton.isHidden = true
    enterButton.addTarget(self, action: #selector(clickEnterButton), for: .touchUpInside)
  }

  func addLogoutButton () {

    view.addSubview(logoutButton)
    logoutButton.snp.makeConstraints { (make) in
      make.width.equalTo(100)
      make.height.equalTo(50)
      make.centerX.equalTo(originFrame.maxX / 2)
      make.centerY.equalTo(originFrame.maxY * 4 / 5)
    }
    logoutButton.layer.cornerRadius = 10
    logoutButton.backgroundColor = .skyBlue
    logoutButton.setTitle("logout", for: .normal)

    logoutButton.isHidden = true
    logoutButton.addTarget(self, action: #selector(clickLogoutButton), for: .touchUpInside)
  }

  @objc func clickEnterButton () {

    let secVC = storyboard?.instantiateViewController(withIdentifier: "tabVC") as? UITabBarController
    present(secVC!, animated: false, completion: nil)
  }

  @objc func clickLogoutButton () {

    GIDSignIn.sharedInstance()?.signOut()
    isLogin = false
  }

  // login 成功後觸發
  func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
    if error != nil {
      print("Login google err: \(String(describing: error))")
    } else {

      UserInfo.shared.userName = user!.profile.name
      UserInfo.shared.userMail = user!.profile.email
      UserInfo.shared.profileImage = "\(user!.profile.imageURL(withDimension: 400)!)"

      print("user name: \(user!.profile.name ?? ""))")
      print("user mail: \(user!.profile.email ?? "")")
      print("user photo: \(user!.profile.imageURL(withDimension: 400)!)")

      isLogin = true
      DispatchQueue.main.async {
        self.loginButton.isHidden = true
      }
    }
  }
}
