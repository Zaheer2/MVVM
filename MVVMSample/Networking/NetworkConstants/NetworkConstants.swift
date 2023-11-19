//
//  NetworkConstants.swift
//  MVVMSample
//
//  Created by Muhammad Zaheer on 16/11/2023.
//

import Foundation

class NetworkConstants {
    
    public static var sharedInstance: NetworkConstants = NetworkConstants()
    
    private init() {
        // Singletone patterns requirement so no other class can reintinitialize it
    }
    
    public var apiKey: String {
        get {
            return "1bbe850363765bef91872057de2ce1a1"
        }
    }
    
    public var server_UrlTrendingMoviesAPI: String {
        get {
            return  "https://api.themoviedb.org/3/trending/all/day?language=en-US" // "https://api.themoviedb.org/3/" tutorial URL
        }
    }

    public var server_UrlImagesAPI: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
} 
