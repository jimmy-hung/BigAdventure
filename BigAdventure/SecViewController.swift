//
//  SecViewController.swift
//  BigAdventure
//
//  Created by 洪立德 on 2019/6/19.
//  Copyright © 2019 洪立德. All rights reserved.
//

import UIKit
import SnapKit

class SecViewController: UIViewController {
  var backButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  override func viewWillAppear(_ animated: Bool) {
    clickBackButton()
  }

  func clickBackButton () {

    view.addSubview(backButton)
    backButton.backgroundColor = .lightGray
    backButton.layer.cornerRadius = 8
    backButton.setTitle("back", for: .normal)
    backButton.snp.makeConstraints { (make) in
      make.width.equalTo(50)
      make.height.equalTo(40)
      make.center.equalToSuperview()
    }

    backButton.addTarget(self, action: #selector(dismissSecVC), for: .touchUpInside)
  }

  @objc func dismissSecVC () {

    dismiss(animated: false, completion: nil)
  }
}
