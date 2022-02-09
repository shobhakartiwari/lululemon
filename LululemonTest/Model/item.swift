//
//  item.swift
//  LululemonTest
//
//  Created by 李金龙 on 14/11/1400 AP.
//

import Foundation

import UIKit

class itemModel {
    var name:String?
    var timeStamp:Double?
    init (name:String?,timeStamp:Double?){
        self.name = name
        self.timeStamp = timeStamp
    }
    init(){}
}
