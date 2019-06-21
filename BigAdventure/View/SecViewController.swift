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
  @IBOutlet weak var collectionView: UICollectionView!
  var backButton = UIButton()
  let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()

      collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: cellId)
      collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
    }

  override func viewWillAppear(_ animated: Bool) {
    addBackButton()
  }

  func addBackButton () {

    view.addSubview(backButton)
    backButton.backgroundColor = .lightGray
    backButton.layer.cornerRadius = 8
    backButton.setTitle("back", for: .normal)
    backButton.snp.makeConstraints { (make) in
      make.width.equalTo(50)
      make.height.equalTo(40)
      make.centerX.equalTo(UIScreen.main.bounds.maxX / 2)
      make.centerY.equalTo(UIScreen.main.bounds.maxY * 5 / 6)
    }

    backButton.addTarget(self, action: #selector(dismissSecVC), for: .touchUpInside)
  }

  @objc func dismissSecVC () {

    dismiss(animated: false, completion: nil)
  }
}
