//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Deepika Ponnaganti on 01/05/23.
//

import Foundation


class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherData = WeatherData.defaultWeatherDataModel
    @Published var hourlyData: ForeCastData = ForeCastData.defaultHourlyDataModel
    @Published var cityName: String = "Visakhapatnam" {
        didSet {
            getSummaryData()
            getHourlyData()
        }
    }
    
    init() {
        getSummaryData()
        getHourlyData()
    }
    
    func getSummaryData() -> Void {
        WeatherService.getResources(url: "current", city: self.cityName) { (result: Result<WeatherData, ErrorCodes>) in
            print("city = \(self.cityName)")
            switch result {
            case .success(let data):
                self.weatherData = data
            case .failure(let error):
                print("error = \(error)")
            }
        }
    }
    
    func getHourlyData() -> Void {
        WeatherService.getResources(url: "forecast", city: self.cityName) { (result: Result<ForeCastData, ErrorCodes>) in
            switch result {
            case .success(let data):
                self.hourlyData = data
            case .failure(let error):
                print("error = \(error)")
            }
        }
    }
    
    func getImageBasedOnClimate(temp: Float, isDay: Int) -> String {
        var imageName: String = "cloudy_ver"
        if determineIsDay(isDayInt: isDay) {
            if temp < 20 {
                imageName = "thunders_ver"
            } else if temp >= 20 && temp < 40 {
                imageName = "mrng_cloudy_ver"
            } else {
                imageName = "sunny_ver"
            }
        }
        return imageName
    }
    
    private func determineIsDay(isDayInt: Int) -> Bool {
        return isDayInt == 1 ? true : false
        
    }
    
    func getImageForHourlyData(temp: Float) -> String {
        var imageName = "cloud.fill"
        if temp < 20 {
            imageName = "cloud.fog.fil"
        } else if temp >= 20 && temp < 40 {
            imageName = "cloud.rain.fill"
        } else {
            imageName = "sun.max.fill"
        }
        return imageName
    }
    
    func getHourlyTime(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd H:mm"
        guard let inDate = dateFormatter.date(from: date) else { return "00:00" }
        dateFormatter.dateFormat = "h:mm a"
        let outTime = dateFormatter.string(from:inDate)
        print("out \(outTime)")
        return outTime
    }
    
    
}
