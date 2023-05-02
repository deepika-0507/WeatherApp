//
//  WeattherServiceManager.swift
//  WeatherApp
//
//  Created by Deepika Ponnaganti on 01/05/23.
//

import Foundation

enum ErrorCodes: Error {
    case cityNotFound
    case timeOutError
}

class WeatherServiceManager {
    
    let urlSession =  URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func getResults(completionHandler: @escaping (Result<WeatherDataModel, Error>) -> ()) {
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: "http://api.weatherapi.com/v1/current.json") {
            urlComponents.query = "key=0e2031ce23c94cecb9d132944230105&q=Paris"
            
            guard let url = urlComponents.url else {
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            dataTask = urlSession.dataTask(with: request) { [weak self] data, response, error in
                guard data != nil || self != nil else {
                    print("Data is nil")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(WeatherDataModel.self, from: data!)
                    DispatchQueue.main.async {
                        completionHandler(.success(decodedData))
                    }
                    
                } catch {
                    DispatchQueue.main.async {
                        completionHandler(.failure(ErrorCodes.cityNotFound))
                    }
                }
                
            }
            
            dataTask?.resume()
        }
    }
}

class WeatherService {
    static func getResults(completionHandler: @escaping (Result<WeatherDataModel, ErrorCodes>) -> ()) {
        if var urlComponents = URLComponents(string: "http://api.weatherapi.com/v1/current.json") {
            urlComponents.query = "key=0e2031ce23c94cecb9d132944230105&q=Paris"
            
            guard let url = urlComponents.url else {
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard data != nil else {
                    print("data is nil")
                    return
                }
                
                print("data = \(String(describing: data))")
                
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(WeatherDataModel.self, from: data!)
                    DispatchQueue.main.async {
                        completionHandler(.success(decodedData))
                    }
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch22:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error code= \(error)")
                    DispatchQueue.main.async {
                        completionHandler(.failure(ErrorCodes.cityNotFound))
                    }
                }
                
            }.resume()
        }
    }
}
