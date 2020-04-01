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
    var tableView = UITableView()
    let tableHeight = CGFloat(250)
    
    var settingArray = ["Profile","Favorite","Notification","Change Password","Logout"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.isScrollEnabled = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    @IBAction func onclickMenu(_ sender: Any) {
        let window = UIApplication.shared.keyWindow
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        transparentView.frame = self.view.frame
        //self.view.addSubview(transparentView)
        window?.addSubview(transparentView)
        
        //
        let screenSize = UIScreen.main.bounds.size
        tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: tableHeight)
        window?.addSubview(tableView)
        
        //
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickTransparentView))
        transparentView.addGestureRecognizer(tapGesture)
        transparentView.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 1
            //
            self.tableView.frame = CGRect(x: 0, y: screenSize.height - self.tableHeight, width: screenSize.height, height: self.tableHeight)
        }, completion: nil)
    }
    
    @objc func onClickTransparentView() {

        let screenSize = UIScreen.main.bounds.size
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            //
            self.tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.tableHeight)
        }, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else {
            fatalError("Can not Dequeue Cell")
        }
        cell.lbl.text = settingArray[indexPath.row]
        cell.settingImage.image = UIImage(named: settingArray[indexPath.row])!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
