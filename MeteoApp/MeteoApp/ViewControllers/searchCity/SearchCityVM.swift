//
//  SearchCityVM.swift
//  MyForcast
//
//  Created by Haithem Rekik on 04/9/2022.
//

import Foundation

class SearchCityVM {
    
    var model = SearchCityModel()
    
    func searchForCityByName(value: String, completion: @escaping(() -> Void)) {
        WeatherRepository.sharedInstance.searchListCitiesByName(value: value) { success, listCities, _ in
            self.model.listCities = listCities
            completion()
        }
    }
    
    /*
     This function will be used on the VC to the get the current list
     */
    func getListCitiesItems() -> [WeatherResponse] {
        return self.model.listCities
    }
    
    /*
     This function will get an item at index
     */
    func getItemAtIndexOf(index: Int) -> WeatherResponse? {
        guard index >= 0 && index < self.model.listCities.count else {
            return nil
        }
        return self.model.listCities[index]
    }
}
