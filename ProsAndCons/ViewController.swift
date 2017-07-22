//
//  ViewController.swift
//  ProsAndCons
//
//  Created by Jordan Ford on 7/21/17.
//  Copyright © 2017 Jordan Ford. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var proTable: UITableView!
    
    var proList = [ProOrCon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        proTable.dataSource = self
        proTable.delegate = self
        proTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            
        if proList.count > 0 {
            return
        }
        proList.append(ProOrCon(title: "Sample Pro"))
        proList.append(ProOrCon(title: "Sample Pro"))
        proList.append(ProOrCon(title: "Sample Pro"))
        }
    
    
        func numberOfSectionsInTableView(proTable: UITableView) -> Int {
            return 1
        }
        
        func proTable(proTable: UITableView!, numberOfRowsInSection section: Int) -> Int {
            return proList.count
        }
        
        func proTable(proTable: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
            let cell = proTable.dequeueReusableCell(withIdentifier: "proCell", for: indexPath)
            let item = proList[indexPath.row]
            cell.textLabel?.text = item.title
           return cell

        }


}


//func proTable(proTable: UITableView,
//           cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//let cell = proTable.dequeueReusableCell(withIdentifier: "proCell", for: indexPath as IndexPath) as! UITableViewCell
//        let item = proList[indexPath.row]
//      cell.textLabel?.text = item.title
//return cell


