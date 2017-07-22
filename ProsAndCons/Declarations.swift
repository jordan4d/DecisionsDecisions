//
//  Declarations.swift
//  ProsAndCons
//
//  Created by Jordan Ford on 7/21/17.
//  Copyright © 2017 Jordan Ford. All rights reserved.
//

import Foundation
import UIKit

class ProOrCons {
    var title: String
    var weight: Int
    var pro: Bool
    
    public init(title:String) {
        self.title = title
        self.weight = 0
        self.pro = true
    }
}

