//
//  Day.swift
//  SwiftUI-Weather
//
//  Created by Alexander Ostrovsky on 05.02.2021.
//

import Foundation

struct Day {
    
    enum DayOfWeek {
        case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    }

    enum Weather {
        case cloudSun, sunMax, windSnow, sunset, snow
    }
    
    let dayOfWeek: DayOfWeek
    let weather: Weather
    let temperature: Int
    
    var dayNameShort: String {
        switch dayOfWeek {
        case .monday:
            return "MON"
        case .tuesday:
            return "TUE"
        case .wednesday:
            return "WED"
        case .thursday:
            return "THU"
        case .friday:
            return "FRI"
        case .saturday:
            return "SAT"
        case .sunday:
            return "SUN"
        }
    }
    
    var imageName: String {
        switch weather {
        case .cloudSun:
            return "cloud.sun.fill"
        case .sunMax:
            return "sun.max.fill"
        case .windSnow:
            return "wind.snow"
        case .sunset:
            return "sunset.fill"
        case .snow:
            return "snow"
        }
    }
}


