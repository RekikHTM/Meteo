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
    
    func loadListCities() {
        self.model.selectedCities = []
        self.model.selectedCities.append(.init(name: "Paris",
                                               lon: 2.349014,
                                               lat: 48.864716))
        
        self.model.selectedCities.append(.init(name: "Casablanca",
                                               lon: -7.615480,
                                               lat: 33.596458))
        
        self.model.selectedCities.append(.init(name: "Tunis",
                                               lon: 10.16579,
                                               lat: 36.81897))
    }
    /*
     This function to load weather by Lat/long
     */
    func loadWeather() {
        WeatherRepository.sharedInstance.callGetListWeathersLonLat(lon: 2.349014, lat: 48.864716) { success, model, error in
            self.delegate?.onLoadNewLists()
        }
    }
    
    /*
     This function to load all the cities in list of names
     */
    func loadListWeatherByCities() {
        WeatherRepository.sharedInstance.callGetListWeatherByListCities(list: self.model.selectedCities, completion: { success, list, error in
           
            self.model.fullListForcast = list
            self.model.filtredList = list
            
            self.delegate?.onLoadNewLists()
        })
    }
    
    /*
     This function will add city to the list
     */
    func addCityToList(city: WeatherResponse) {
        let area = city.name ?? ""
        let lon: Float = Float(city.coord?.lon ?? 0)
        let lat: Float = Float(city.coord?.lat ?? 0)
        let cit: CityModel = .init(
                        name: area,
                        lon: lon,
                        lat: lat)
        self.model.selectedCities.append(cit)
    }
    
    /*
     This function will be used on the VC to the get the current list
     */
     func getListWeatherItems() -> [WeatherResponse] {
        return self.model.filtredList
    }
    
    /*
     This function will get an item at index
     */
    func getItemAtIndexOf(index: Int) -> WeatherResponse? {
        guard index >= 0 && index < self.model.filtredList.count else {
            return nil
        }
        return self.model.filtredList[index]
    }
    
    /*
     This function will remove an item at index
     */
    func removeItemAtIndexOf(index: Int){
        guard index >= 0 && index < self.model.filtredList.count else {
            return
        }
        let item = self.model.filtredList[index]
        self.model.filtredList = self.model.filtredList.filter({
            $0.id != item.id
        })
        self.model.fullListForcast = self.model.fullListForcast.filter({
            $0.id != item.id
        })
        self.model.selectedCities = self.model.selectedCities.filter({
            $0.name != item.name
        })
       
    }
    
    /*
     this function will be called when textField been changed and filter the fullList by name
     */
    func searchForCityWeaher(value: String) {
        guard !value.isEmpty else {
            self.model.filtredList = self.model.fullListForcast
            self.delegate?.onLoadNewLists()
            return
        }
        let value = value.lowercased()
        self.model.filtredList = self.model.fullListForcast.filter({
            $0.name?.lowercased().contains(value) ?? false || $0.sys?.country.lowercased().contains(value) ?? false
        })
        self.delegate?.onLoadNewLists()
    }
}
