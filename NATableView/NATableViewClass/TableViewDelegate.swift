
import UIKit

protocol CellDidSelectRowProtocol{
    func didSelectRow(dataTypeDM:DataTypeDM, indexpath:IndexPath)
}


extension CellDidSelectRowProtocol {
    func didSelectRow(dataTypeDM:DataTypeDM, indexpath:IndexPath){}
}


class TableViewDelegate: NSObject, UITableViewDelegate {
    var item = [DataTypeDM]()
    var delegate: CellDidSelectRowProtocol?

    init(item:[DataTypeDM]) {
        self.item = item
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.item[indexPath.row]
        delegate?.didSelectRow(dataTypeDM: item, indexpath:indexPath)
    }
}


