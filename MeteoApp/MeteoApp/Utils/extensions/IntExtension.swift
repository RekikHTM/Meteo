//
//  IntExtension.swift
//  MyForcast
//
//  Created by Haithem Rekik on 04/9/2022.
//

import Foundation

extension Int {
    
    /*
     This function to get if the number statusCode is valid or not
     */
    func isValidStatusCode() -> Bool {
        let arrSuccess = 200...205
        return arrSuccess.contains(self)
    }
}
