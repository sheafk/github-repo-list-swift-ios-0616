//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    
    var repositories: [GithubRepository] = [] //This array will hold the info
    
    func getRepositoriesWithCompletion(completion:() -> () ) {
        
        GithubAPIClient.getRepositoriesWithCompletion { (responseData) in
            
            self.repositories.removeAll() //This empties the array
            for dictionary in responseData { //Using a for in loop to loop over each dictionary in the array from Github
                guard let repoDictionary = dictionary as? NSDictionary else {assertionFailure("Object in reposArray is of non-dictionary type"); return}
                let repository = GithubRepository(dictionary: repoDictionary)
                self.repositories.append(repository)
                
            }
            if self.repositories.count > 0 {
                completion()
            }
            
        }
        
    }

}
