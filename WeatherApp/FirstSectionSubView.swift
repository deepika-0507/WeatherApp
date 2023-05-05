//
//  FirstSectionSubView.swift
//  WeatherApp
//
//  Created by Deepika Ponnaganti on 03/05/23.
//

import SwiftUI

struct FirstSectionSubView: View {
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    var hourlyData: HourlyWeatherModel
    var body: some View {
        VStack(spacing: 10) {
            Text("\(weatherViewModel.getHourlyTime(date: hourlyData.time))")
                .font(.system(size: 14))
//            Text("AM")
//                .font(.system(size: 12.0))
            Image(systemName: weatherViewModel.getImageForHourlyData(temp: hourlyData.temp_c))
                .renderingMode(.template)
                .foregroundColor(.white)
            Text("\(hourlyData.temp_c, specifier: "%.1f")") +
            Text("O")
                .font(.system(size: 8.0))
                .baselineOffset(8.0)
        }
    }
}

//struct FirstSectionSubView_Previews: PreviewProvider {
//    static var previews: some View {
//        FirstSectionSubView(hourlyData: Binding.constant(ForeCastDataModel.defaultHourlyDataModel))
//    }
//}
