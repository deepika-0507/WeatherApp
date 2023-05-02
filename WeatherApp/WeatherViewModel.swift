//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Deepika Ponnaganti on 01/05/23.
//

import Foundation


class WeatherViewModel: ObservableObject {
    @Published var data: WeatherDataModel?
    
    init() {
        WeatherService.getResults() { result in
            switch result {
            case .success(let data):
                self.data = data
                print("data = \(data.current.temp_c)")
            case .failure(let error):
                print("eror= \(error)")
            }

        }
    }
    
    
}
