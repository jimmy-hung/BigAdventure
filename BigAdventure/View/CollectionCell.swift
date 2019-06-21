//
//  collectionCell.swift
//  BigAdventure
//
//  Created by 洪立德 on 2019/6/20.
//  Copyright © 2019 洪立德. All rights reserved.
//

import UIKit
import SnapKit

class CollectionCell: UICollectionViewCell {

  let label = UILabel()
  let detailLabel = UILabel()
  let profilePicture = UIImageView()

  var showDetailLabel = false
  var showProfilePicture = false

  override func layoutSubviews() {
    addSubview(label)
    label.snp.makeConstraints { (make) in
      make.left.equalTo(snp.left).offset(20)
      make.right.equalTo(snp.right).offset(-20)
      make.top.equalTo(snp.top).offset(0)
      make.height.equalTo(50)
    }

    addDetailLabel ()
    addProfilePicture ()
  }

  func addDetailLabel () {
    if showDetailLabel {
      addSubview(detailLabel)
      detailLabel.snp.makeConstraints { (make) in
        make.left.equalTo(snp.left).offset(20)
        make.right.equalTo(snp.right).offset(-20)
        make.top.equalTo(label.snp.bottom).offset(0)
        make.bottom.equalTo(snp.bottom).offset(0)
      }
    }
  }

  func addProfilePicture () {
    if showProfilePicture {
      addSubview(profilePicture)
      profilePicture.snp.makeConstraints { (make) in
        make.left.equalTo(snp.left).offset(20)
        make.right.equalTo(snp.right).offset(-300)
        make.top.equalTo(label.snp.bottom).offset(-10)
        make.bottom.equalTo(snp.bottom).offset(0)
      }
    }
  }

  override func prepareForReuse() {
    showDetailLabel = false
    showProfilePicture = false
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
