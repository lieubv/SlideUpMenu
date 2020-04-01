//
//  ViewController.swift
//  SlideUpMenu
//
//  Created by alex on 4/1/20.
//  Copyright © 2020 alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var transparentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onclickMenu(_ sender: Any) {
        let window = UIApplication.shared.keyWindow
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        transparentView.frame = self.view.frame
        //self.view.addSubview(transparentView)
        window?.addSubview(transparentView)
    }
    
}

