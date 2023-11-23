//
//  DetailsViewController.swift
//  MVVMSample
//
//  Created by Muhammad Zaheer on 23/11/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var label_Title: UILabel!
    @IBOutlet weak var imageView_banner: UIImageView!
    @IBOutlet weak var label_Details: UILabel!
    
    var detailsViewModel: DetailsViewModel? // property injection
    
    
    //MARK: - initializer injection
    required init(_ detailsViewModel: DetailsViewModel) {
        self.detailsViewModel = detailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        self.imageView_banner.image = #imageLiteral(resourceName: "movieImage")
        self.label_Title.text = detailsViewModel?.title
        self.label_Details.text = detailsViewModel?.details
    }
}
