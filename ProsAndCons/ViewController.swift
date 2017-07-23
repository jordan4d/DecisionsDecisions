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
    @IBOutlet var conTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proTable.reloadData()
        conTable.reloadData()
    
        //Swipe Gesture Down
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeForPro(swipe:)))
        downSwipe.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(downSwipe)
        //Swipe Gesture Up
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeForCon(swipe:)))
        upSwipe.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(upSwipe)

        //Tables
        
        proTable.dataSource = self
        proTable.delegate = self
        proTable.register(UITableViewCell.self, forCellReuseIdentifier: "proCell")
        
        conTable.dataSource = self
        conTable.delegate = self
        conTable.register(UITableViewCell.self, forCellReuseIdentifier: "conCell")
        //Flips table
        self.conTable.transform = CGAffineTransform(scaleX: 1, y: -1)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count:Int?
        
        if tableView == self.proTable {
            count = pMgr.pros.count
        }
        
        if tableView == self.conTable {
            count =  cMgr.cons.count
        }
        
        return count!

    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
    
        if tableView == self.proTable {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "proCell", for: indexPath)
            cell?.textLabel?.text = pMgr.pros[indexPath.row].name
            cell?.textLabel?.textColor = UIColor.white
            cell?.backgroundColor = cellBkgdColorPickerPro(weight: pMgr.pros[indexPath.row].weight)
            
        }
        
        if tableView == self.conTable {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "conCell", for: indexPath)
            cell?.textLabel?.text = cMgr.cons[indexPath.row].name
            cell?.textLabel?.textColor = UIColor.white
            cell?.backgroundColor = cellBkgdColorPickerCon(weight: cMgr.cons[indexPath.row].weight)
            //Flips Cell
            cell?.transform = CGAffineTransform(scaleX: 1, y: -1)
            
        }
        
        return cell!
        
    }
    
    
        

    
    
//
//    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
//        if (editingStyle == UITableViewCellEditingStyle.delete){
//            pMgr.pros.remove(at: indexPath.row)
//            proTable.reloadData()
//        }
//    }
//
//    //Con Table
//
//    func tableView(_ tableView: conTable, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Default Cons")
//        
//        cell.textLabel?.text = cMgr.cons[indexPath.row].name
//        cell.textLabel?.textColor = UIColor.white
//        cell.backgroundColor = cellBkgdColorPicker(weight: cMgr.cons[indexPath.row].weight)
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: conTable, numberOfRowsInSection section: Int) -> Int {
//        
//        return cMgr.cons.count
//    }
//    
//    func tableView(tableView: conTable, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
//        if (editingStyle == UITableViewCellEditingStyle.delete){
//            cMgr.cons.remove(at: indexPath.row)
//            conTable.reloadData()



    
    //Swiping
    func swipeForPro(swipe:UISwipeGestureRecognizer)
    {
        performSegue(withIdentifier: "goPro", sender: self)
    }
    
    func swipeForCon(swipe:UISwipeGestureRecognizer)
    {
        performSegue(withIdentifier: "goCon", sender: self)
    }
    
    //Colors
    func cellBkgdColorPickerPro(weight:Float) -> UIColor
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
    
    func cellBkgdColorPickerCon(weight:Float) -> UIColor
    {
        if weight == 1 {
            return UIColor(red: 255/255, green: 99/255, blue: 79/255, alpha: 1.0)
        }
        if weight == 2 {
            return UIColor(red: 239/255, green: 93/255, blue: 74/255, alpha: 1.0)
        }
        if weight == 3 {
            return UIColor(red: 229/255, green: 90/255, blue: 70/255, alpha: 1.0)
        }
        if weight == 4 {
            return UIColor(red: 191/255, green: 74/255, blue: 59/255, alpha: 1.0)
        }
        else {
            return UIColor(red: 160/255, green: 62/255, blue: 49/255, alpha: 1.0)
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
