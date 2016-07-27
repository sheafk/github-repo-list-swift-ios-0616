//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient { //This class is used to contain the code that translates a JSON into an NSArrat.
        
   
    class func getRepositoriesWithCompletion(completion: (NSArray) -> ()) { //Notice the different syntax for using a completion block.
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        if let githubURL = NSURL(string: "https://api.github.com/repositories?client_id=57c08e03e7d8a358ea2b&client_secret=7e7c7493f002b56673e1cadeb21eba00db739c19") {
            
            let githubTask = session.dataTaskWithURL(githubURL, completionHandler: { (data, response, error) in
                if let data = data {
                    
                    do {
                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSArray
                        
                        NSOperationQueue.mainQueue().addOperationWithBlock({ //All of the code before this is happening on a thread outside of the main thread. This function moves data onto the mainthread so that it can be used by UI elements
                            completion(responseData)
                            print("My API Client is working!")
                        })
                        
                        //print(responseData)
                    } catch {
                        print("Fail!")
                    }
                    
                }
            })
            githubTask.resume() //This is the call to the internet.
        }
        
    }
    
    
}

