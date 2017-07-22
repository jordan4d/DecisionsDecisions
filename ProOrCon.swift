//
//  ProOrCon.swift
//  ProsAndCons
//
//  Created by Jordan Ford on 7/22/17.
//  Copyright © 2017 Jordan Ford. All rights reserved.
//

import UIKit

class ProOrCon: NSObject {
    var title: String
    var weight: Int
    var pro: Bool
    
    init(title:String) {
        self.title = title
        self.weight = 0
        self.pro = true
    }
}
