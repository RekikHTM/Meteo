//
//  HomePageVC.swift
//  MeteoApp
//
//  Created by Haithem REKIK on 13/03/2023.
//

import Foundation

protocol HomePageVMDelegate {
    func onLoadNewLists()
}

class HomePageVM {
    
    var delegate: HomePageVMDelegate?
    var model = HomePageModel()
    
    /*
     This function to load weather by Lat/long
     */
    func loadWeather() {
        WeatherRepository.sharedInstance.callGetListWeathersLonLat(lon: -7.615480, lat: 33.596458) { success, model, error in
            self.delegate?.onLoadNewLists()
        }
    }
}
