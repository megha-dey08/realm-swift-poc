//
//  ViewController.swift
//  realDemo
//
//  Created by Vibha Kumari Dey on 06/05/25.
//

import UIKit
import RealmSwift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }


}

