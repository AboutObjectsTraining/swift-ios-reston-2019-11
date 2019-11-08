// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

class ReadingListController: UITableViewController
{
    @IBOutlet var dataSource: DataSource!
    
    @IBAction func done(segue: UIStoryboardSegue) {
        tableView.reloadData()
        dataSource.save()
    }
    
    @IBAction func cancel(segue: UIStoryboardSegue) { }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let controller = segue.realDestination as? ViewBookController else { return }
        
        controller.book = dataSource.book(at: indexPath)
    }
}












//// MARK: - UITableViewDataSource methods
//extension ReadingListController
//{
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 100
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell: UITableViewCell
//
//        if let cachedCell = tableView.dequeueReusableCell(withIdentifier: "Book") {
//            cell = cachedCell
//        } else {
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Book")
//        }
//
//        cell.textLabel?.text = "Row \(indexPath.row + 1)"
//        return cell
//    }
//}
