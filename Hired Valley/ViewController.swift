//
//  ViewController.swift
//  Hired Valley
//
//  Created by ellkaden on 10.09.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradientBackground(
            purpleColors: [UIColor.appPurple10.cgColor, UIColor.appPurple20.cgColor],
            blackColors: [UIColor.appBlack10.cgColor, UIColor.black.cgColor]
        )
    }


}

