//
//  SummaryView.swift
//  WeatherApp
//
//  Created by Deepika Ponnaganti on 03/05/23.
//

import SwiftUI

struct SummaryView: View {
    @Binding var weatherData: WeatherData
    
    var body: some View {
        VStack(spacing: 10) {
            Text(weatherData.location.name)
                .font(.title)
            Text("\(weatherData.current.temp_c, specifier: "%.1f")")
                .font(.system(size: 70))
            + Text("o")
                .font(.system(size: 20.0))
                .baselineOffset(40.0)
            Text("Dizzle")
                .font(.body)
            Text("H: 31  L: 24")
        }
        .padding()
        .foregroundColor(.white)
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(weatherData: Binding.constant(WeatherData.defaultWeatherDataModel))
    }
}
