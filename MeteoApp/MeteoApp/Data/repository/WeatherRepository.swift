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
    
    func callGetListWeathersLonLat(lon: Double,
                                   lat: Double,
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
}
