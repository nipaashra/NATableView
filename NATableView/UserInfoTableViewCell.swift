//
//  UserInfoTableViewCell.swift
//  NATableView
//
//  Created by Apple on 20/03/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit


protocol UserInfoTableViewCellProtocol:ViewControllerTableViewCellDelegatable {
    func btnDeleteClicked(sender:UIButton)
}

class UserInfoTableViewCell: UITableViewCell, CellTypeProtocol {
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    var viewControllerDelegate: UserInfoTableViewCellProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func cellConfiguration(with model: DataTypeDM, indexpath: IndexPath?) {
        if let userDM:UserInfo = model.mType as? UserInfo{
            self.imgUser?.image = userDM.imgUser
            self.lblName.text = userDM.name
            self.btnDelete.tag = indexpath!.row
        }
    }
    
    @IBAction func btnDeleteClicked(_ sender: UIButton) {
        viewControllerDelegate.btnDeleteClicked(sender: sender)
    }
    
    
    //ViewControllerTableViewCellDelegatable
    
    func updateViewControllerDelegate(viewControllerDelegate: ViewControllerTableViewCellDelegatable?) {
        self.viewControllerDelegate = viewControllerDelegate as? UserInfoTableViewCellProtocol
    }
      
    
}
