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
        
        //高度自适应 (方式二)
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let label = cell.contentView.viewWithTag(1000) as! UILabel
        label.text = textValues as String
        if dict[String(indexPath.row)] == "0" {
            label.numberOfLines = 0
        } else {
            label.numberOfLines = 1
        }
        //分割线顶头(方式二)
        cell.separatorInset = UIEdgeInsets.zero
        return cell
    }
    
    //高度自适应 (方式一)
    /*
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     let att = [NSFontAttributeName: UIFont.systemFont(ofSize: 17)]
     
     let height = textValues.boundingRect(with: CGSize(width: 300, height: 0), options: .usesLineFragmentOrigin, attributes: att, context: nil).size.height+30
     
     return height
     }
     */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let label = cell?.contentView.viewWithTag(1000) as! UILabel
        
        /*
         if label.numberOfLines == 0 {
         label.numberOfLines = 1
         dict[String(indexPath.row)] = "1"
         } else {
         label.numberOfLines = 0
         dict[String(indexPath.row)] = "0"
         }
         tableView.reloadData()
         */
        //有动画效果
        tableView.beginUpdates()
        if label.numberOfLines == 0 {
            label.numberOfLines = 1
            dict[String(indexPath.row)] = "1"
        } else {
            label.numberOfLines = 0
            dict[String(indexPath.row)] = "0"
        }
        tableView.endUpdates()
        
    }
    
    
    //分割线顶头(方式一)
    /*
     override func viewDidLayoutSubviews() {
     self.tableView.separatorInset = UIEdgeInsets.zero
     self.tableView.layoutMargins = UIEdgeInsets.zero
     }
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
     cell.separatorInset = UIEdgeInsets.zero
     cell.layoutMargins = UIEdgeInsets.zero
     }
     */
    
    
    
}

