//
//  SecondViewModel.swift
//  MVVMSample
//
//  Created by Muhammad Zaheer on 21/11/2023.
//

import Foundation

class SecondViewModel {
    
    let isLoading : Observable<Bool> = Observable(false)
    var dataSource: TrendingMoviesModel?
    var cellDataSource : Observable<[Movies]> = Observable([])

    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRowsIn(_ section: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }
    
    func heightForRowIn() -> CGFloat {
        50.0
    }
    
    
    func getTrendingMovies() {
        if isLoading.value == true {
            return
        }
        
        self.isLoading.value = true
        
        ApiRequestsManager.shared.getData { [weak self] result in
            switch result {
            case .success(let response):
                print(response.results.count)
                self?.isLoading.value = false
                self?.dataSource = response
                self?.mapCellDataSource(response.results)
            case .failure(let error):
                print(error)
                self?.isLoading.value = false
            }
        }
    }
    
    func mapCellDataSource(_ movies: [Movies]) {
        self.cellDataSource.value = movies
    }
    
//    func getTitle(_ obj: Movies) -> String {
//        return obj.name ?? obj.title ?? ""
//    }
}
