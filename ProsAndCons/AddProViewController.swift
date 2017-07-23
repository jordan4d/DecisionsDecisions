//
//  AddProViewController.swift
//  ProsAndCons
//
//  Created by Jordan Ford on 7/21/17.
//  Copyright © 2017 Jordan Ford. All rights reserved.
//

import UIKit

class AddProViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var proTitle: UITextField!
    @IBOutlet weak var proWeight: UISlider!
    @IBAction func btnAddPro(sender : UIButton){
        if (proTitle.text == ""){
            //Pro Title is blank, do not add a record
        } else {
            //add record
            pMgr.addPro(name: proTitle.text!, weight: proWeight.value)
            
            //dismiss keyboard and reset fields
            
            self.view.endEditing(true)
            proTitle.text = nil
        }
    }
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(rightSwipe)

        // Do any additional setup after loading the view.
    }

    //Hide Status Bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipeAction(swipe:UISwipeGestureRecognizer)
    {
        performSegue(withIdentifier: "swipeRightBack", sender: self)
    }

    
    
}
