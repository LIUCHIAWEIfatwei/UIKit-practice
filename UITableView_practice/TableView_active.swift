//
//  TableView_active.swift
//  UITableView_practice
//
//  Created by Lavatar on 2018/11/30.
//  Copyright © 2018 chiaWei. All rights reserved.
//

import UIKit

class TableView_active: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    //建立 TableView 屬性
    var myTableView : UITableView!
    
    //建立 測試數據 屬性
    var info : [String] = ["林書豪", "陳信安","陳偉殷","王建民","王大明","葉大雄"]
    
    //設定 Cell 名稱
    let Cell = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //基本設定 (AppDelegate)
        //建立 UIScreen
        let fullScreenSize : CGSize = UIScreen.main.bounds.size
        
        
        self.title = "編輯模式"
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        
        //建立 TableView
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height - 64), style: .plain)
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        //設定 cell
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: Cell)
        
        //導覽列左(右)邊 按鈕 編輯 & 新增
        myTableView.setEditing(true, animated: false)
        self.editBtnAction()
        
        //設定 必要協定
        //繼承
        myTableView.dataSource = self
        myTableView.delegate = self
        
        //是否可以點選 cell
        myTableView.allowsSelection = true
        
        //是否可以多選 cell
        myTableView.allowsMultipleSelection = false
        
        //加入畫面
        self.view.addSubview(myTableView)
        
        
    }
    
    //按下編輯按鈕時執行的動作方法
    @objc func editBtnAction() {
        myTableView.setEditing(!myTableView.isEditing, animated: true)
        
        if (!myTableView.isEditing) {
            //顯示左邊按鈕_編輯
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(TableView_active.editBtnAction))
            
            //顯示右邊按鈕_新增
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(TableView_active.addBtnAction))
            
        } else {
            //顯示編輯完成 按鈕
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(TableView_active.editBtnAction))
            
            //隱藏 新增 按鈕
            self.navigationItem.rightBarButtonItem = nil
            
        }
    }
    
    //按下 新增按鈕 執行動作 方法
    @objc func addBtnAction()  {
        print("add complete")
        info.insert("new row", at: 0)
        
        //新增 cell 在第一筆 row
        myTableView.beginUpdates()
        myTableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
        myTableView.endUpdates()
    }
    
    //各cell 是否可以進入編輯狀態 及 左滑刪除
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //編輯狀態時 拖曳切換 cell 位置後 執行動作 方法
    //必須實作這個方法才會出現 拖曳功能
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        print("\(sourceIndexPath.row) to \(destinationIndexPath.row)")
        
        var tempArr : [String] = []
        
        if (sourceIndexPath.row) > (destinationIndexPath.row) {
            //排到後面的  往前
            for (index, value) in info.enumerated() {
                if index < destinationIndexPath.row || index > sourceIndexPath.row {
                    tempArr.append(value)
                } else if index == destinationIndexPath.row {
                    tempArr.append(info[sourceIndexPath.row])
                } else if index <= sourceIndexPath.row {
                    tempArr.append(info[index - 1])
                }
            }
        }
        else if (sourceIndexPath.row) < (destinationIndexPath.row) {
            //排在前面的 往後
            for (index, value) in info.enumerated() {
                if index < sourceIndexPath.row || index > destinationIndexPath.row {
                    tempArr.append(value)
                } else if index < destinationIndexPath.row {
                    tempArr.append(info[index + 1])
                } else if index == destinationIndexPath.row {
                    tempArr.append(info[sourceIndexPath.row])
                }
            }
        }
        else {
            tempArr = info
        }
        info = tempArr
        
    }
    
    //編輯狀態時 按下刪除 cell 後 執行動作 方法
    //必須實作這個方法 才能左滑刪除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let name : String = info[indexPath.row]
        
        if editingStyle == .delete {
            info.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
            print("刪除的是 \(name)")
            
        }
    }
    
    
    //設定section 數量
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //設定 cell 數量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    //cell 顯示內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell, for: indexPath) as UITableViewCell
        
        //顯示內容
        if let myLabel = cell.textLabel {
            myLabel.text = "\(info[indexPath.row])"
        }
        
        return cell
    }
    
    
}
