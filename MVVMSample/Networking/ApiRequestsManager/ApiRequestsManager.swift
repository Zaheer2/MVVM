//
//  ApiRequestsManager.swift
//  MVVMSample
//
//  Created by Muhammad Zaheer on 16/11/2023.
//

import Foundation

enum ErrorMessage: Error {
    case ErrorValidatingURL
    case ResponseError
    case CantParseData
}

class ApiRequestsManager {
    
    public static var shared: ApiRequestsManager = ApiRequestsManager()
    
    private init() {
    }
    
//    func getTrendingMoviesList( completionHandler: @escaping (_ result: Result<TrendingMoviesModel, ErrorMessage>) -> Void) {
//        
//        let urlString = NetworkConstants.sharedInstance.server_UrlTrendingMoviesAPI
//        guard let url = URL(string: urlString)
//        else {
//            completionHandler(.failure(ErrorMessage.ErrorValidatingURL))
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, UrlResponse, error in
//            if error != nil {
//                if let data = data {
//                    if let parsedResponse = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data) {
//                        completionHandler(.success(parsedResponse))
//                    }
//                }
//            }
//            completionHandler(.failure(ErrorMessage.ResponseError))
//        }.resume()
//    }
    
    func getData(completionHandler: @escaping (Result<TrendingMoviesModel, ErrorMessage>) -> Void) {
  
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmJlODUwMzYzNzY1YmVmOTE4NzIwNTdkZTJjZTFhMSIsInN1YiI6IjY1NTViOGM5ZWE4NGM3MTA5MTBjMDg5MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DcKIk6QtcNcp3j3LFEkR6jhFmpohTfDCFMm7U7xWXTo"
        ]
        
        var request = URLRequest(url: NSURL(string: "https://api.themoviedb.org/3/trending/movie/day?language=en-US")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        
        session.dataTask(with: request) { data, urlResponse, error in
            
            if error == nil {
                if let data = data {
                    if let jsonResult = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data) {
                        completionHandler(.success(jsonResult))
                    }
                    else {
                        completionHandler(.failure(.CantParseData))
                    }
                }
            }
            else {
                completionHandler(.failure(.ResponseError))
            }
        }.resume()
        
    }
}
