//
//  SecondViewController + TableView.swift
//  MVVMSample
//
//  Created by Muhammad Zaheer on 21/11/2023.
//

import Foundation
import UIKit

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        self.secondViewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.secondViewModel.numberOfRowsIn(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
        
        
//        cell.label_title.text = self.secondViewModel.getTitle(self.arr_MoviesList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.secondViewModel.heightForRowIn() 
    }
    
    func setDataSourceDelegates() {
        self.tableView_Home.dataSource = self
        self.tableView_Home.delegate = self
    }
    
    func reloadTableViewWithData() {
        DispatchQueue.main.async {
            self.tableView_Home.reloadData()
        }
    }
    
}
