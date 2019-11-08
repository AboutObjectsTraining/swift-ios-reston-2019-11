// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

class DataSource: NSObject
{
    @IBOutlet var storeController: ReadingListStore!
    lazy var readingList = storeController.fetch()
    
    func book(at indexPath: IndexPath) -> Book {
        return readingList.book(at: indexPath)
    }
    
    func save() {
        storeController.save(readingList: readingList)
    }
}
 
// MARK: - UITableViewDataSource methods
extension DataSource: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        readingList.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Book") else {
            fatalError("Unable to dequeue a book cell. Check the storyboard")
        }
        
        let book = readingList.book(at: indexPath)
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = "\(book.year ?? " -- ")  \(book.author?.fullName ?? "Unknown")"
        
        return cell
    }
}
