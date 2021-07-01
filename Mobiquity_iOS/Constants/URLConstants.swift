//
//  URLConstants.swift
//  Mobiquity_iOS
//
//  Created by Pavan on 27/06/21.
//

import Foundation
class URLConstants {
    
    internal static func WeatherURLForCity(location: String)-> String
    {
        return "http://api.openweathermap.org/data/2.5/weather?q="+location+"&appid="+AppConstants.appToken+"&units=metric"
    }
    
    internal static func WeatherForeCastListURLForCoordinates(lat: String, long: String)-> String
    {
        return "http://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(long)&appid=fae7190d7e6433ec3a45285ffcf55c86&units=metric"
    }
}
