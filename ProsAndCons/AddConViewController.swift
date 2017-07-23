//
//  AddProViewController.swift
//  ProsAndCons
//
//  Created by Jordan Ford on 7/21/17.
//  Copyright © 2017 Jordan Ford. All rights reserved.
//

import UIKit

class AddConViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conTitle: UITextField!
    @IBOutlet weak var conWeight: UISlider!
    @IBAction func btnAddCon(_ sender: UIButton) {
        if (conTitle.text == ""){
            //Con Title is blank, do not add a record
        } else {
            //add record
            cMgr.addCon(name: conTitle.text!, weight: conWeight.value)
            
            //dismiss keyboard and reset fields
            
            self.view.endEditing(true)
            conTitle.text = nil
        }
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
