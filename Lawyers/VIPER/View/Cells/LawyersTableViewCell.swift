//
//  LawyersTableViewCell.swift
//  Lawyers
//
//  Created by Saravana on 03/11/22.
//

import UIKit
import SDWebImage

class LawyersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPhoneLabel: UILabel!
    @IBOutlet weak var userAddressLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setListUI(details: Data?) {
        
        if details?.name == "" {
            contentView.isHidden = true
        }else{
            userNameLabel.text = details?.name
            userPhoneLabel.text = details?.phone_no
            userAddressLabel.text = details?.address
            profileImage.sd_setImage(with: URL(string: details?.profile_picture ?? ""))
        }
        
    }
    
}
