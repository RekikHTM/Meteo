//
//  WeatherRepository.swift
//  MeteoApp
//
//  Created by Haithem REKIK on 13/03/2023.
//

import Foundation
import Alamofire

class WeatherRepository {
    static let sharedInstance = WeatherRepository()
    
    func callGetListWeathersLonLat(lon: Float,
                                   lat: Float,
                                   completion: @escaping((_ success: Bool,
                                                          _ model: WeatherResponse?,
                                                          _ error: String?) -> Void)) {
        let params: [String: Any] = [
            Constants.latKey: lat,
            Constants.lonKey: lon,
            Constants.unitsKey: "metric",
            Constants.apiIdKey: Constants.apiWeatherId,
            Constants.langKey: "fr"
        ]
        let headers: [String: String] = [:]
        apiRequest(url: Constants.getListWeathersPath,
                   params: params,
                   headers: headers) { success, response, statusCode in
            guard statusCode.isValidStatusCode() else {
                print("failed API")
                completion(false, nil, Constants.msgErrorServer)
                return
            }
            let decoder = JSONDecoder()
            do {
                let res = try decoder.decode(WeatherResponse.self, from: response as! Data)
                print("API success")
                print(res.name ?? "")
                completion(true, res, nil)
            } catch {
                // parse object to specific ErrorModel to get the exact issue
                print("failed json parser")
                completion(false, nil, Constants.msgErrorServer)
            }
            
        }
    }
    
    func callGetListWeatherByListCities(list: [CityModel],
                                        completion: @escaping((_ success: Bool,
                                                               _ list: [WeatherResponse],
                                                               _ error: String?) -> Void)) {
        var listWeather: [WeatherResponse] = []
        list.forEach { cityModel in
            self.callGetListWeathersLonLat(lon: cityModel.lon,
                                           lat: cityModel.lat) { _, model, error in
                                
                listWeather.append(model ?? WeatherResponse(coord: Coord(lon: 0.0, lat: 0.0), weather: [], base: "", main: nil, visibility: 0, wind: nil, clouds: nil, dt: 0, sys: nil, timezone: 0, id: -9999, name: "", cod: 0))
                if listWeather.count == list.count {
                    listWeather = listWeather.filter({$0.id != -9999})
                    completion(true, listWeather, error)
                }
            }
            
        }
    }
}
