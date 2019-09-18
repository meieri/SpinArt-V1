//
//  SpinArtV1Tests.swift
//  SpinArtV1Tests
//
//  Created by Isaak Meier on 9/13/19.
//  Copyright © 2019 Isaak Meier. All rights reserved.
//

import XCTest
@testable import SpinArtV1

class SpinArtV1Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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

    func testPaperPoint() {
        let frame = CGRect(x: 0, y: 0, width: 250, height: 250)

        let point = CGPoint(x: 50, y: 50)
        let point1 = CGPoint(x: 125, y: 125)
        let point2 = CGPoint(x: 0, y: 0)
        let point3 = CGPoint(x: 250, y: 250)
        let point4 = CGPoint(x: 73.9, y: 122.5)

        let paperPoint = PaperPoint(point: point, frame: frame)
        let paperPoint1 = PaperPoint(point: point1, frame: frame)
        let paperPoint2 = PaperPoint(point: point2, frame: frame)
        let paperPoint3 = PaperPoint(point: point3, frame: frame)
        let paperPoint4 = PaperPoint(point: point4, frame: frame)

        XCTAssertEqual(paperPoint.x, -75)
        XCTAssertEqual(paperPoint.y, -75)
        XCTAssertEqual(paperPoint.getPoint(), point)

        XCTAssertEqual(paperPoint1.x, 0)
        XCTAssertEqual(paperPoint1.y, 0)
        XCTAssertEqual(paperPoint1.getPoint(), point1)

        XCTAssertEqual(paperPoint2.x, -125)
        XCTAssertEqual(paperPoint2.y, -125)
        XCTAssertEqual(paperPoint2.getPoint(), point2)

        XCTAssertEqual(paperPoint3.x, 125)
        XCTAssertEqual(paperPoint3.y, 125)
        XCTAssertEqual(paperPoint3.getPoint(), point3)

        XCTAssertEqual(paperPoint4.x, -51.099999999999994)
        XCTAssertEqual(paperPoint4.y, -2.5)
        XCTAssertEqual(paperPoint4.getPoint(), point4)
    }
}
