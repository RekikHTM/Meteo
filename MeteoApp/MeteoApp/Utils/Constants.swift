//
//  Constants.swift
//  MyForcast
//
//  Created by Haithem Rekik on 04/9/2022.
//

import Foundation

class Constants {
    static let apiWeatherId         = "2bbea62ca4c2c05398f5cabf1605def6"
    
    static let baseUrl              = "https://api.openweathermap.org/"
    static let pathImgIcon          = "https://openweathermap.org/img/wn/***@2x.png"
    static let getListWeathersPath  = baseUrl + "data/2.5/weather"
    
    
    static let msgErrorServer       = "Erreur Server"
    
    static let latKey               = "lat"
    static let lonKey               = "lon"
    static let apiIdKey             = "appid"
    static let unitsKey             = "units"
    static let langKey              = "lang"
    static let citySearchKey        = "q"
   
    
}
