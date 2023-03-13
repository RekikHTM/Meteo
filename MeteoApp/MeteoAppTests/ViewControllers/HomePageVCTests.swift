//
//  HomePageVCTests.swift
//  MeteoApp
//
//  Created by Haithem REKIK on 13/03/2023.
//

import XCTest

@testable import MeteoApp

class HomePageVCTests: XCTestCase {
    let vcHome = HomePageVC()
    
    func testHomePageVC() {
        vcHome.loadViewIfNeeded()
    }
    
    /*
     Test Login with api request
     */
    func testloadWeather() {

        let expectationValid = XCTestExpectation(description: "Valid")
        
        
        WeatherRepository.sharedInstance.callGetListWeathersLonLat(lon: 2.349014, lat: 48.864716) { success, model, _ in
            XCTAssertNotNil(model)
            XCTAssertTrue(success)
            expectationValid.fulfill()
        }
        wait(for: [expectationValid], timeout: 10.0)
        XCTAssertTrue(true)
    }
}
