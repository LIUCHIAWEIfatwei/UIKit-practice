//
//  ViewController.swift
//  UITableView_practice
//
//  Created by Lavatar on 2018/11/29.
//  Copyright © 2018 chiaWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var info : [[String]] = [["林書豪", "陳信安"], ["陳偉殷","王建民","王大明","葉大雄"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        let fullScreen = UIScreen.main.bounds.size
        
        //設置UITableView. 並設置原點&尺寸.
        let myTableView = UITableView(frame: CGRect(x: 0, y: 20, width: fullScreen.width , height: fullScreen.height - 20), style: .grouped)
        
        
        
        
        
    }


}

