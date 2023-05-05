//
//  ContentView.swift
//  WeatherApp
//
//  Created by Deepika Ponnaganti on 01/05/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    var body: some View {
        let currentData = weatherViewModel.weatherData.current
        let forecastData = weatherViewModel.hourlyData.forecast.forecastday[0]
        
        ScrollView(.vertical) {
            SummaryView(weatherData: $weatherViewModel.weatherData)
//            ForEach(1...5, id: \.self) { _ in
                VStack {
                    Section(header:
                                Text(currentData.condition.text)
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                    ){
                        Divider()
                            .background(.white)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(forecastData.hour, id: \.self) { hourlyData in
                                    FirstSectionSubView(hourlyData: hourlyData )
                                        .environmentObject(weatherViewModel)
                                }
                            }
                            .padding()
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background {
                    SectionBackgroundView()
                }
//            }
        }
        .background {
            Image(weatherViewModel.getImageBasedOnClimate(temp: currentData.temp_c, isDay: currentData.is_day))
                .resizable()
                .ignoresSafeArea()
                .overlay(Color.black.opacity(0.24))
            
        }
        
    }
}

struct SectionBackgroundView: View {
    var body: some View {
        Rectangle()
            .cornerRadius(10.0)
            .padding()
            .foregroundColor(Color.black.opacity(0.3))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(WeatherViewModel())
    }
}
