//
//  HomePageVC.swift
//  MeteoApp
//
//  Created by Haithem REKIK on 13/03/2023.
//

import Foundation

struct HomePageModel {
    var fullListForcast: [WeatherResponse] = []
    var  filtredList: [WeatherResponse] = []
    var selectedCities: [CityModel] = []

}
