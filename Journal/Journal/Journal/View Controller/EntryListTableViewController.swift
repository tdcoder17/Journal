//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Theo Davis on 1/12/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    //MARK: - Outlets
    
    
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        EntryController.shared.loadFromPersistanceStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.shared.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        let entry = EntryController.shared.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title
//        cell.detailTextLabel?.text = entry.text

        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteEntry = EntryController.shared.entries[indexPath.row]
            EntryController.shared.deleteEntry(titleEntryDelete: deleteEntry)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEntryDetailVC" {
            
            guard let index = tableView.indexPathForSelectedRow else { return }
            
            guard let destination = segue.destination as? EntryDetailViewController else { return }
            
            let entry = EntryController.shared.entries[index.row]
            
            destination.entry = entry
        }
    }
}//END OF CLASS
