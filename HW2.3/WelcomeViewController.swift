//
//  WelcomeViewController.swift
//  HW2.3
//
//  Created by Георгий Бутров on 30.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var WelcomeLabel: UILabel!
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WelcomeLabel.text = "Hello, \(userName)! Welcome!"
    }
    
}
