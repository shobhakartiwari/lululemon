//
//  LululemonTestTests.swift
//  LululemonTestTests
//
//  Created by Test User on 1/28/22.
//

import XCTest
import CoreData
@testable import LululemonTest

class LululemonTestTests: XCTestCase {

    var objListVM : ListModel?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        objListVM =  ListModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        objListVM = nil
    }

    
    func testGetCount() {
        let count = objListVM?.getCount()
        XCTAssertEqual(count, 0)
        
    }
    
    func testInsertData() {
        let handler = APIHandler.shared
        var previousCount = 0
         var afterCount = 0
        handler.fetchData { (arr:[Item],error: Error?) in
            XCTAssertNil(error)
            previousCount = arr.count
        }
   
        handler.insertItem(name: "Test", time: 1566494600)
        handler.insertItem(name: "Test1", time: 1566494605)
        handler.fetchData { (arr:[Item],error: Error?) in
            XCTAssertNil(error)
            afterCount = arr.count
        }
        XCTAssertEqual(afterCount, previousCount + 2)

    }


}
