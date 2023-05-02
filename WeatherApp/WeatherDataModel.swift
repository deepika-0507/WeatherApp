//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Created by Deepika Ponnaganti on 01/05/23.
//

import Foundation


struct WeatherDataModel: Decodable {
    let location: LocationModel
    let current: CurrentDataModel
}

struct LocationModel: Decodable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let localtime: String
}

struct CurrentDataModel: Decodable {
    let last_updated: String
    let temp_c: Decimal
    let temp_f: Decimal
    let is_day: Int
}

