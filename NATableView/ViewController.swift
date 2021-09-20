//
//  ViewController.swift
//  NATableView
//
//  Created by Apple on 20/03/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class UserInfo:DataTypeProtocol{
    var imgUser: UIImage?
    var name: String = ""
    init(){
        
    }
    init(imgUser: UIImage, name:String) {
        self.imgUser = imgUser
        self.name = name
    }
    
}


class ViewController: UIViewController {

    @IBOutlet weak var tblUserList: UITableView!
    var dataSource: TableViewDataSource?
    var delegate: TableViewDelegate?
    var items: [DataTypeDM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.items.append(DataTypeDM.init(mType: UserInfo.init(imgUser: UIImage(named: "doll1")!, name: "John"), reUseId: "UserInfoTableViewCell"))
        self.items.append(DataTypeDM.init(mType: UserInfo.init(imgUser: UIImage(named: "doll2")!, name: "Krish"), reUseId: "UserInfoTableViewCell"))
        self.items.append(DataTypeDM.init(mType: UserInfo.init(imgUser: UIImage(named: "doll3")!, name: "Yan"), reUseId: "UserInfoTableViewCell"))
        self.prepareUI()
        print("Hello")
    }


}

extension ViewController{
    func prepareUI(){
        self.tblUserList?.rowHeight = 84
        self.commonTableViewMethod()
    }
    
    func commonTableViewMethod(){
        self.dataSource = TableViewDataSource.init(item: self.items)
        self.delegate = TableViewDelegate.init(item: self.items)
        self.tblUserList?.dataSource = dataSource
        self.tblUserList?.delegate = delegate
        self.delegate?.delegate = self
        self.dataSource?.viewControllerDelegate = self
        self.tblUserList.reloadData()
    }

}

extension ViewController: CellDidSelectRowProtocol{
    func didSelectRow(dataTypeDM: DataTypeDM, indexpath: IndexPath) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let objVC:DetailViewController = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        if let userDM:UserInfo = dataTypeDM.mType as? UserInfo{
            objVC.strName = userDM.name
        }
        self.navigationController?.pushViewController(objVC, animated: true)
    }
}

extension ViewController: UserInfoTableViewCellProtocol{
    func btnDeleteClicked(sender: UIButton) {
        self.items.remove(at: sender.tag)
        self.commonTableViewMethod()
    }
}
