//
//  HomeTableViewCell.swift
//  MVVMSample
//
//  Created by Muhammad Zaheer on 15/11/2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var label_MovieRating: UILabel!
    @IBOutlet weak var label_MovieReleaseDate: UILabel!
    @IBOutlet weak var label_Name: UILabel!
    @IBOutlet weak var imageView_Movie: UIImageView!
//    @IBOutlet weak var label_title: UILabel!
    
    @IBOutlet weak var view_Holder: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCorner()
        setBorder()
    }

    
    private func setCorner() {
        self.view_Holder.setViewRound() // due to providing default value
//        self.view_Holder.setViewRound(15)
    }
    
    private func setBorder() {
        self.view_Holder.setViewBorderAndColor()
    }
    
    func setUpCell(viewModel: HomeTableViewCellViewModel) {
        label_Name.text = viewModel.name
        label_MovieReleaseDate.text = viewModel.releaseDate 
        label_MovieRating.text = "\(viewModel.voteAverage)/10"
        imageView_Movie.image =  #imageLiteral(resourceName: "movieImage") // #imageLiteral(resourceName: "DiceSix") or type #imageLiteral( just in Xcode Version 15.0.1 (15A507
    }
    
}
