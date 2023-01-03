//
//  SecondViewController.swift
//  Lesson3_M3
//
//  Created by mac on 4/1/23.
//

import UIKit

class SecondViewController: UIViewController {

    var info = ""
    
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        infoLabel.text = info
        // Do any additional setup after loading the view.
    }
     
}
