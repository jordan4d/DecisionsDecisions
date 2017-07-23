//
//  ViewController.swift
//  ProsAndCons
//
//  Created by Jordan Ford on 7/21/17.
//  Copyright © 2017 Jordan Ford. All rights reserved.
//

import UIKit

class ViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var proTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proTable.reloadData()
    
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        downSwipe.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(downSwipe)

    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Default Pros")
        
        cell.textLabel?.text = pcMgr.pros[indexPath.row].name
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = cellBkgdColorPicker(weight: pcMgr.pros[indexPath.row].weight)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pcMgr.pros.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if (editingStyle == UITableViewCellEditingStyle.delete){
            pcMgr.pros.remove(at: indexPath.row)
            proTable.reloadData()
        }
    }


    func swipeAction(swipe:UISwipeGestureRecognizer)
    {
        performSegue(withIdentifier: "goRight", sender: self)
    }
    
    func cellBkgdColorPicker(weight:Float) -> UIColor
    {
        if weight == 1 {
        return UIColor(red: 67/255, green: 242/255, blue: 169/255, alpha: 1.0)
        }
        if weight == 2 {
            return UIColor(red: 62/255, green: 224/255, blue: 157/255, alpha: 1.0)
        }
        if weight == 3 {
            return UIColor(red: 48/255, green: 176/255, blue: 124/255, alpha: 1.0)
        }
        if weight == 4 {
            return UIColor(red: 42/255, green: 153/255, blue: 107/255, alpha: 1.0)
        }
        else {
            return UIColor(red: 34/255, green: 124/255, blue: 87/255, alpha: 1.0)
        }
    }
    


    

}

//
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//
//        if proList.count > 0 {
//            return
//        }
//        proList.append(ProOrCon(title: "Sample Pro"))
//        proList.append(ProOrCon(title: "Sample Pro"))
//        proList.append(ProOrCon(title: "Sample Pro"))
//        }
//
//
//        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//            return 1
//        }
//
//        func tableView(_ tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
//            return proList.count
//        }
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "proCell", for: indexPath)
//            let item = proList[indexPath.row]
//            cell.textLabel?.text = item.title
//           return cell
//
//        }
//
//
//}


//func tableView(tableView: UITableView,
//           cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//let cell = tableView.dequeueReusableCell(withIdentifier: "proCell", for: indexPath as IndexPath) as! UITableViewCell
//        let item = proList[indexPath.row]
//      cell.textLabel?.text = item.title
//return cell
