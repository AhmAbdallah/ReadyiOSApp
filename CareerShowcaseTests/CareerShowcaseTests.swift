//
//  CareerShowcaseTests.swift
//  CareerShowcaseTests
//
//  Created by Ahmed's Mac on 10/24/18.
//  Copyright © 2018 CareerShowcase. All rights reserved.
//

import XCTest
@testable import CareerShowcase
@testable import SwiftyJSON

class CareerShowcaseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testWork()  {
        var json : [Any] = []
            let dict = [
            "name": "iOS Developer",
            "description": "Mga BiliÅŸim Ltd. Åžti.",
            "period": "Apr 2018 â€“ Present",
            "id": 0
                ] as [String : Any]
        json.append(dict)
        let j = JSON.init(json)
        let workViewModel = WorkViewModel(j)
        XCTAssertEqual(workViewModel.name, "a")
    }
    
}
