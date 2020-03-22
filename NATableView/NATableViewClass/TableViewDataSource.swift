

import UIKit

//Method of pass the self of ViewController
protocol ViewControllerTableViewCellDelegatable: class {}

protocol CellTypeProtocol{
    //    static var reuseId: String { get }
    func cellConfiguration(with model: DataTypeDM, indexpath:IndexPath?)
    
    // Tableviewcell protocol call: by pass delegate (self) of ViewController
    func updateViewControllerDelegate(viewControllerDelegate: ViewControllerTableViewCellDelegatable?)
}


protocol DataTypeProtocol {
    
}

class DataTypeDM{
    var mType:DataTypeProtocol!
    var reUseId:String = String()
    var index: Int = 0
    init(mType: DataTypeProtocol, reUseId:String, index: Int? = nil) {
        self.mType = mType
        self.reUseId = reUseId
        self.index = index ?? 0
    }
    func cellConfigurationMethod(dmObj:DataTypeDM,cellView:CellTypeProtocol,indexpath:IndexPath?) {
        cellView.cellConfiguration(with: dmObj, indexpath:indexpath)
    }
        
}


class TableViewDataSource: NSObject, UITableViewDataSource {
    weak var viewControllerDelegate: ViewControllerTableViewCellDelegatable?
    var item = [DataTypeDM]()
    init(item:[DataTypeDM]) {
        self.item = item
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.item[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.reUseId)
        cell?.selectionStyle = .none
        self.udpateDelegate(cellProtocol: cell as! CellTypeProtocol)
        item.cellConfigurationMethod(dmObj: item, cellView:cell! as! CellTypeProtocol, indexpath: indexPath)
        return cell!
    }
    
    func udpateDelegate(cellProtocol: CellTypeProtocol){
        let cellType: CellTypeProtocol = cellProtocol
        cellType.updateViewControllerDelegate(viewControllerDelegate: self.viewControllerDelegate)
    }
}
