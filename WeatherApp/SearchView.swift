//
//  SearchView.swift
//  WeatherApp
//
//  Created by Deepika Ponnaganti on 08/05/23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    @Binding var showScreen: Bool
    @State var city = ""
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .renderingMode(.template)
                        .foregroundColor(Color.gray)
                    TextField("Search for a city", text: $city)
                        .onSubmit {
                            showScreen.toggle()
                            print("city TextView = \(city)")
                            weatherViewModel.cityName = city
                        }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.34)))
                .cornerRadius(0.5)
                .padding()
            }
            .navigationTitle( Text("Weather"))
            .navigationBarTitleDisplayMode(.large)
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(showScreen: Binding.constant(true))
    }
}
