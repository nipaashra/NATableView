//
//  DetailViewController.swift
//  NATableView
//
//  Created by Apple on 20/03/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var strName: String = ""
    @IBOutlet weak var lblName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblName.text = strName
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
