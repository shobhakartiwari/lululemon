//
//  AddViewModel.swift
//  LululemonTest
//
//  Created by 李金龙 on 14/11/1400 AP.
//

import Foundation
class AddViewModel{
    
    
    var item:Item?
    func saveItem(itemName: String){
        let apiHandler = APIHandler.shared

        apiHandler.insertItem(name: itemName, time: Date().timeIntervalSince1970)

    }
}
