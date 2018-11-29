//
//  ViewController.swift
//  UITableView_practice
//
//  Created by Lavatar on 2018/11/29.
//  Copyright © 2018 chiaWei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    var info : [[String]] = [["林書豪", "陳信安"], ["陳偉殷","王建民","王大明","葉大雄"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        let fullScreen = UIScreen.main.bounds.size
        
        //設置UITableView. 並設置原點&尺寸.
        let myTableView = UITableView(frame: CGRect(x: 0, y: 20, width: fullScreen.width , height: fullScreen.height - 20), style: .grouped)
        
        //註冊 cell
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        //設定分隔線樣式
        myTableView.separatorStyle = .singleLine
        
        //分隔線的間隔 上左下右
        myTableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        //是否可以點選 cell
        myTableView.allowsSelection = true
        
        //是否可以多選 cell
        myTableView.allowsMultipleSelection = false
        
        
        
        //設置委任對象
        myTableView.dataSource = self
        myTableView.delegate = self
        
        //加入到畫面
        self.view.addSubview(myTableView)
        
        
    }
    
    //設定 section 數量
    func numberOfSections(in tableView: UITableView) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        var title : String = ""
        if section == 0 {
            title = "籃球"
        } else {
            title = "棒球"
        }
        
        return title
    }
    
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //取得tableView目前使用的 cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        //設定 Accessory 按鈕樣式
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.accessoryType = .checkmark
            }else if indexPath.row == 1 {
                cell.accessoryType = .detailButton
            }else if indexPath.row == 2 {
                cell.accessoryType = .detailDisclosureButton
            }else {
                cell.accessoryType = .disclosureIndicator
            }
        }
        
        //顯示內容
        if let myLabel = cell.textLabel {
            myLabel.text = "\(info[indexPath.section][indexPath.row])"
        }
        
        
        return cell
    }


}

