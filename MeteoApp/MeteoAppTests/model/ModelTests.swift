 // 
 // ModelTests.swift
 //  MeteoApp
 //
 //  Created by Haithem REKIK on 13/03/2023.
 //

 import XCTest

 @testable import MeteoApp

/*
 This class inherit from XCTestCase, for testing all Model features
 */

class ModelTests: XCTestCase {

    func testCityModel() {
        let model = CityModel(name: "Test", lon: 0, lat: 0)
        XCTAssertNotNil(model)
    }

}
