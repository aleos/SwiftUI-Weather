//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Alexander Ostrovsky on 05.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    private let forecast: [Day] = [
        Day(dayOfWeek: .tuesday, weather: .cloudSun, temperature: 74),
        Day(dayOfWeek: .wednesday, weather: .sunMax, temperature: 88),
        Day(dayOfWeek: .thursday, weather: .windSnow, temperature: 55),
        Day(dayOfWeek: .friday, weather: .sunset, temperature: 60),
        Day(dayOfWeek: .saturday, weather: .snow, temperature: 25),
    ]
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 20) {
                    ForEach(0 ..< forecast.count) { dayNumber in
                        WeatherDayView(weather: forecast[dayNumber])
                    }
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var weather: Day
    
    var body: some View {
        VStack {
            Text(weather.dayNameShort)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: weather.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 40)
            Text("\(weather.temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
