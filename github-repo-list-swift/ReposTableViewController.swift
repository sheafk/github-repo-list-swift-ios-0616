//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    let dataStore = ReposDataStore.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.accessibilityLabel = "tableView"
        
        GithubAPIClient.getRepositoriesWithCompletion { (responseData) in
            print(responseData)
            //Set UILabel here
        }
        
        dataStore.getRepositoriesWithCompletion { 
            self.tableView.reloadData()
        }
    }
    




    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataStore.repositories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
        
        let repository:GithubRepository = self.dataStore.repositories[indexPath.row]
        cell.textLabel?.text = repository.fullName
        
        return cell
    }

}


