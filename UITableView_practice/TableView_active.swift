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
    let cell = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //基本設定
        //建立 UIScreen
        let fullScreenSize = UIScreen.main.bounds.size
        
        //設定 TableView_active view backgroundColor
        self.view.backgroundColor = UIColor.blue
        
        self.title = "編輯模式"
        
        self.navigationController!.navigationBar.isTranslucent = false
        
        
        //建立 TableView
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height - 64), style: .plain)
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        //設定 cell
        myTableView.register(UITableView.self, forCellReuseIdentifier: cell)
        
        //導覽列左(右)邊 按鈕 編輯 & 新增
        myTableView.setEditing(true, animated: false)
        self.editBtnAction()
        
        //設定 必要協定
        //繼承
        myTableView.dataSource = self
        myTableView.delegate = self
        
        
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
    
    @objc func addBtnAction()  {
        print("add complete")
    }
    
    
    
    //設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
