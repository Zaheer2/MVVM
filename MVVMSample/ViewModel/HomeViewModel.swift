//
//  HomeViewModel.swift
//  MVVMSample
//
//  Created by Muhammad Zaheer on 15/11/2023.
//

import UIKit
import Foundation


class HomeViewModel {
    
    var isLoading : Observable = Observable(false)
    var dataSource : TrendingMoviesModel?
    var cellDataSource : Observable<[HomeTableViewCellViewModel]> = Observable([])
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }
    

    
    
    func getApiCalled() {
        if self.isLoading.value == true {
            return
        }
        
        isLoading.value = true
        
        ApiRequestsManager.shared.getData { [weak self] response in
            switch response {
            case .success(let data):
                print(data.results.count)
                self?.isLoading.value = false
                self?.dataSource = data
                self?.mapCellDataSource()
            case .failure(let error):
                print(error)
                self?.isLoading.value = false
            }
        }
    }
    
    func mapCellDataSource() {
        self.cellDataSource.value =  self.dataSource?.results.compactMap({HomeTableViewCellViewModel(movie: $0)}) ?? []  // self.dataSource?.results ?? []
    }
    
//    func passMoviesTitle(_ obj : Movies) -> String {
//        return obj.name ?? obj.title ?? ""
//    }
}
