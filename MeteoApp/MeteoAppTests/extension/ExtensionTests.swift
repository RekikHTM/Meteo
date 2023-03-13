 //
 //  ExtensionTests.swift
 //  MeteoApp
 //
 //  Created by Haithem REKIK on 13/03/2023.
 //

 import XCTest

 @testable import MeteoApp

/*
  This class inherit from XCTestCase, for testing all Extension features
 */

class ExtensionTests: XCTestCase {
    /*
        Test Int extension isValidStatusCode
     */
    func testUicolor() {
        XCTAssertTrue(201.isValidStatusCode())
    }
}
