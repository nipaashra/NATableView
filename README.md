# NATableView

NATableView is a common structure of TableView Datasource and Delegate Methods.

  - No need to define all methods of tableview in required class
  - Just declare common tableview structure 

# How to use this structure?
    var items: [DataTypeDM] = []
    func commonTableViewMethod(){
        self.dataSource = TableViewDataSource.init(item: self.items)
        self.delegate = TableViewDelegate.init(item: self.items)
        self.tblUserList?.dataSource = dataSource
        self.tblUserList?.delegate = delegate
        self.delegate?.delegate = self
        self.dataSource?.viewControllerDelegate = self
        self.tblUserList.reloadData()
    }

# Description:
  - Items are list of array which is model of data
  - Create custom datasource and delegate, pass to the real.
  









