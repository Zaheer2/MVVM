//
//  HomeViewController.swift
//  MVVMSample
//
//  Created by Muhammad Zaheer on 15/11/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var tableView_Home: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // ViewModel 
    var viewModel : HomeViewModel = HomeViewModel()
    var cellDataSource = [HomeTableViewCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewDelegatesDatasources()
        self.bindViewModel()
        
        
//        thisNonEscapingCompletionHandler { _ in
//            print("Late channge from : NonEscapingCompletionHandler")
//        }
//        
//        thisIsEscapingCompletion { _ in
//            print("Late channge from an EscapingCompletionHandler")
//        }
        
        
    }
    
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getApiCalled()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading as Bool? else {
                return
            }
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
        
        
        viewModel.cellDataSource.bind({ [weak self] arr_movies in
            guard let self = self, let arr = arr_movies as [HomeTableViewCellViewModel]? else {
                return
            }
            
            self.cellDataSource = arr
            self.reloadTableView()
        })
    }
    


//    func thisIsEscapingCompletion(completion: @escaping (String) -> ()) {
//        completion("This is method calling body of Escaping completion handler")
//    }
//
//    func thisNonEscapingCompletionHandler(completion: (String) -> Void) {
//        completion("This is method calling body of Non-escaping completion handler")
//    }
}

