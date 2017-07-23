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
        self.conTable.transform = CGAffineTransform(scaleX: 1, y: -1)         //Flips table
        
    }
    
    //Results
    func getResults() -> Bool {
        var supremeTotal: Float = 0
        for con in cMgr.cons {
            supremeTotal -= con.weight
        }
        for pro in pMgr.pros {
            supremeTotal += pro.weight
        }
        if supremeTotal >= 0 {
            return true
        }
        else {
            return false
        }
    }
    
    //Shaking
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("Device was shaken!")
        shakeForResults(proOrCon: getResults())
    }
    
    //Hide Status Bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //Tables
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
            print(pMgr.pros[indexPath.row].weight)
        }
        
        if tableView == self.conTable {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "conCell", for: indexPath)
            cell?.textLabel?.text = cMgr.cons[indexPath.row].name
            cell?.textLabel?.textColor = UIColor.white
            cell?.backgroundColor = cellBkgdColorPickerCon(weight: cMgr.cons[indexPath.row].weight)
            cell?.transform = CGAffineTransform(scaleX: 1, y: -1)            //Flips Cell
            
        }
        
        return cell!
        
    }
    //Delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if (editingStyle == UITableViewCellEditingStyle.delete){
            
            if tableView == self.proTable {
                pMgr.pros.remove(at: indexPath.row)
                proTable.reloadData()
            }
            if tableView == self.conTable {
                cMgr.cons.remove(at: indexPath.row)
                conTable.reloadData()
            }
        }
    }
    
    //Swiping
    func swipeForPro(swipe:UISwipeGestureRecognizer)
    {
        performSegue(withIdentifier: "goPro", sender: self)
    }
    
    func swipeForCon(swipe:UISwipeGestureRecognizer)
    {
        performSegue(withIdentifier: "goCon", sender: self)
    }
    
    //Shake For Results
    func shakeForResults(proOrCon: Bool) {
        if proOrCon {
        performSegue(withIdentifier: "proResults", sender: self)
        }
        else {
        performSegue(withIdentifier: "conResults", sender: self)
        }
    }
    
    //Colors
    func cellBkgdColorPickerPro(weight:Float) -> UIColor
    {
        if round(weight) == 0 {
            return UIColor(red:0.70, green:0.95, blue:0.89, alpha:1.0)
        }
        if round(weight) == 1 {
            return UIColor(red:0.70, green:0.95, blue:0.89, alpha:1.0)
        }
        if round(weight) == 2 {
            return UIColor(red:0.49, green:0.88, blue:0.78, alpha:1.0)
        }
        if round(weight) == 3 {
            return UIColor(red:0.33, green:0.80, blue:0.68, alpha:1.0)
        }
        if round(weight) == 4 {
            return UIColor(red:0.21, green:0.70, blue:0.58, alpha:1.0)
        }
        else {
            return UIColor(red:0.10, green:0.62, blue:0.49, alpha:1.0)
        }
    }
    
    func cellBkgdColorPickerCon(weight:Float) -> UIColor
    {
        if round(weight) == 0 {
            return UIColor(red:1.00, green:0.59, blue:0.56, alpha:1.0)
        }
        if round(weight) == 1 {
            return UIColor(red:1.00, green:0.59, blue:0.56, alpha:1.0)
        }
        if round(weight) == 2 {
            return UIColor(red:0.96, green:0.42, blue:0.38, alpha:1.0)
        }
        if round(weight) == 3 {
            return UIColor(red:0.85, green:0.27, blue:0.23, alpha:1.0)
        }
        if round(weight) == 4 {
            return UIColor(red:0.73, green:0.15, blue:0.11, alpha:1.0)
        }
        else {
            return UIColor(red:0.58, green:0.06, blue:0.02, alpha:1.0)
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



