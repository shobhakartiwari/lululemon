//
//  ListModel.swift
//  LululemonTest
//
//  Created by 李金龙 on 14/11/1400 AP.
//

import Foundation

class ListModel {
    var arr = [Item]()
    
    func getDatabaseInfo(num: Int){
        let handler = APIHandler.shared
        handler.fetchData { (arr:[Item], error: Error?) in
            if error == nil{
                if num == 0{
                    self.arr  = arr.sorted(by: { (g1, g2) -> Bool in
                        g1.name! < g2.name!
                    })
                }else{
                    self.arr  = arr.sorted(by: { (g1, g2) -> Bool in
                        g1.time < g2.time
                    })
                }
            }
        }
    }
    
    func getCount() -> Int{
        return arr.count
    }
    
    func getName(index: Int)-> String?{
        return arr[index].name
    }
}
