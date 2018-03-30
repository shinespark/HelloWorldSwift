//
//  ViewController.swift
//  HelloWorld
//
//  Created by metroid on 2018/03/30.
//  Copyright © 2018 shinespark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func tapGreen(_ sender: Any) {
        view.backgroundColor = UIColor.green
    }
    
    
    @IBAction func tapWhite(_ sender: Any) {
        view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

