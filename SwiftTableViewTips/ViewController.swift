//
//  ViewController.swift
//  SwiftTableViewTips
//
//  Created by Edward on 2017/8/17.
//  Copyright © 2017年 Edward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let textValues: NSString = "这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n"
    
    var dict: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //去掉多余cell的分割线
        tableView.tableFooterView = UIView()
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        
        let bottomView = cell.contentView.viewWithTag(2000)
        let imageView = cell.contentView.viewWithTag(2001)
        
        //相对屏幕的高度
        let rect = bottomView?.convert((bottomView?.bounds)!, to: nil)
        
        var Y = UIScreen.main.bounds.size.height - (rect?.origin.y)! - 600
        Y *= 0.2
        if Y > 0 {
            Y = 0
        }
        if Y < -100 {
            Y = -100
        }
        imageView?.frame.origin.y = Y
        
        //分割线顶头(方式二)
        cell.separatorInset = UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for cell in tableView.visibleCells {
            
            let bottomView = cell.contentView.viewWithTag(2000)
            let imageView = cell.contentView.viewWithTag(2001)
            
            //相对屏幕的高度
            let rect = bottomView?.convert((bottomView?.bounds)!, to: nil)
            
            var Y = UIScreen.main.bounds.size.height - (rect?.origin.y)! - 600
            Y *= 0.2
            if Y > 0 {
                Y = 0
            }
            if Y < -100 {
                Y = -100
            }
            imageView?.frame.origin.y = Y
        }
    }
    
    
    
}

