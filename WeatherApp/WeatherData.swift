//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Deepika Ponnaganti on 01/05/23.
//

import Foundation


struct WeatherData: Decodable {
    let location: LocationModel
    let current: CurrentDataModel
}

struct ForeCastData: Decodable {
    let location: LocationModel
    let current: CurrentDataModel
    let forecast: ForeCastModel
}

struct ForeCastModel: Decodable {
    let forecastday: [ForeCastDayModel]
}

struct ForeCastDayModel: Decodable {
    let date: String
    let hour: [HourlyWeatherModel]
}

struct HourlyWeatherModel: Decodable, Hashable {
    let time: String
    let temp_c: Float
    let temp_f: Float
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
    let temp_c: Float
    let temp_f: Float
    let is_day: Int
    let condition: Condition
}

struct Condition: Decodable {
    let text: String
    let icon: String
    let code: Int
}

extension WeatherData {
    static let defaultWeatherDataModel = WeatherData(location: LocationModel(name: "Hyderabad", region: "Telangana", country: "India", lat: 30.9, lon: 50.8, localtime: "2023-05-03 17:58"), current: CurrentDataModel(last_updated: "2023-05-03 17:45", temp_c: 28.9, temp_f: 82.0, is_day: 1, condition: Condition(text: "Raing Conditions", icon: "icon", code: 1024)))
}

extension ForeCastData {
    static let defaultHourlyDataModel = ForeCastData(location: LocationModel(name: "Hyderabad", region: "Telangana", country: "India", lat: 30.9, lon: 50.8, localtime: "2023-05-03 17:58"), current: CurrentDataModel(last_updated: "2023-05-03 17:45", temp_c: 28.9, temp_f: 82.0, is_day: 1, condition: Condition(text: "Raing Conditions", icon: "icon", code: 1024)), forecast: ForeCastModel(forecastday: [ForeCastDayModel(date: "2023-05-03 17:45", hour: [HourlyWeatherModel(time: "12:00", temp_c: 28.9, temp_f: 82.0)])]))
}

