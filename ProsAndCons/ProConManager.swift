//
//  ProConManager.swift
//  ProsAndCons
//
//  Created by Jordan Ford on 7/22/17.
//  Copyright © 2017 Jordan Ford. All rights reserved.
//

import UIKit

//Pro Declaration

var pMgr: ProManager = ProManager()

struct pro {
    var name = "Name"
    var weight: Float = 1
}

class ProManager: NSObject {
    var pros = [pro]()
    
    func addPro(name: String, weight: Float){
        pros.append(pro(name: name, weight: weight))
    }
}

//Con Declaration 

var cMgr: ConManager = ConManager()

struct con {
    var name = "Name"
    var weight: Float = 1
}

class ConManager: NSObject {
    var cons = [con]()
    
    func addCon(name: String, weight: Float){
        cons.append(con(name: name, weight: weight))
    }
}




		
