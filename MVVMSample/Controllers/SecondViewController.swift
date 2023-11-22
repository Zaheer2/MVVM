//
//  SecondViewController.swift
//  MVVMSample
//
//  Created by Muhammad Zaheer on 21/11/2023.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var tableView_Home: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    
    var secondViewModel : SecondViewModel = SecondViewModel()
    var cellDataSource = TrendingMoviesModel.self
    var arr_MoviesList = [Movies]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.setDataSourceDelegates()
        self.bindViewModel()
    }
    
    //MARK: - Action
    @IBAction func aciton_callAPI(_ sender: Any) {
        secondViewModel.getTrendingMovies()
    }
    
    
    func bindViewModel() {
        secondViewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading as Bool? else { return }
            
            if isLoading {
                DispatchQueue.main.async {
                    self.activityIndicator.startAnimating()
                }
            }
            else {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        secondViewModel.cellDataSource.bind { [weak self] arr_Movies in
            guard let self = self, let arr = arr_Movies as [Movies]? else { return }
            
            self.arr_MoviesList = arr
            self.reloadTableViewWithData()
        }
    }
 
    
}
