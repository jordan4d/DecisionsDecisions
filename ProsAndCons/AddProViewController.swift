//
//  AddProViewController.swift
//  ProsAndCons
//
//  Created by Jordan Ford on 7/21/17.
//  Copyright © 2017 Jordan Ford. All rights reserved.
//

import UIKit

class AddProViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var proTitle: UITextField!
    @IBOutlet weak var proWeight: UISlider!
    
    
}
