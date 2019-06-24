//
//  CompleteViewController.swift
//  BigAdventure
//
//  Created by 洪立德 on 2019/6/21.
//  Copyright © 2019 洪立德. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  override func viewWillAppear(_ animated: Bool) {
    DispatchQueue.main.async {
      self.tableView.layer.cornerRadius = 15
      self.tableView.clipsToBounds = true
    }
  }
}
