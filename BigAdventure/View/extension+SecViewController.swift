//
//  extension+SecViewController.swift
//  BigAdventure
//
//  Created by 洪立德 on 2019/6/20.
//  Copyright © 2019 洪立德. All rights reserved.
//

import UIKit
import SDWebImage

extension SecViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  func numberOfSections(in collectionView: UICollectionView) -> Int {

    return 3
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: 100)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: 30)
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)

    guard let collectionCell = cell as? CollectionCell
    else { return cell }

    if indexPath.section == 0 {

      collectionCell.label.text = "N a m e :"
      collectionCell.showDetailLabel = true
      collectionCell.detailLabel.text = UserInfo.shared.userName
    } else if indexPath.section == 1 {

      collectionCell.label.text = "E m a i l :"
      collectionCell.showDetailLabel = true
      collectionCell.detailLabel.text = UserInfo.shared.userMail
    } else if indexPath.section == 2 {
      collectionCell.label.text = "P r o f i l e p i c t u r e :"
      collectionCell.showProfilePicture = true
      collectionCell.profilePicture.clipsToBounds = true
      collectionCell.profilePicture.layer.cornerRadius = 10
      let url = UserInfo.shared.profileImage!
      collectionCell.profilePicture.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "me.jpg"))
    }
    return collectionCell
  }
}
