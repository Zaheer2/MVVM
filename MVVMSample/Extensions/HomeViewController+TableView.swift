//
//  HomeViewController+TableView.swift
//  MVVMSample
//
//  Created by Muhammad Zaheer on 15/11/2023.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableViewDelegatesDatasources() {
        self.tableView_Home.delegate = self
        self.tableView_Home.dataSource = self
        self.tableView_Home.tableFooterView = UIView()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView_Home.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
//        let title = self.viewModel.passMoviesTitle(self.cellDataSource[indexPath.row])
        
        let cellViewModel = viewModel.cellDataSource.value[indexPath.row]
        cell.setUpCell(viewModel: cellViewModel)
        cell.selectionStyle = .none
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndexID = viewModel.cellDataSource.value[indexPath.row].id
        guard let object = self.viewModel.passSelectedObjectWith(selectedIndexID) else { return }
        
        let detailViewModel = DetailsViewModel(object)
        let detailVC = DetailsViewController(detailViewModel)
        
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        
        
    }
}
