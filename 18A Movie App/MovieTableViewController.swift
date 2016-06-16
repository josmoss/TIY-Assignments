//
//  MovieTableViewController.swift
//  18A Movie App
//
//  Created by Joe Moss on 6/15/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {

// Create typealias
    typealias JSONDictionary = [String:AnyObject]
    typealias JSONArray = [JSONDictionary]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        class Movie {
        
            var title: String = ""
            var posterPath: String = ""
            
            init() {
                self.title = ""
                self.posterPath = ""

            }
            
            init(title: String, posterPath: String) {
                self.title = title
                self.posterPath = posterPath

            }
            
            init(jsonDictionary: JSONDictionary) {
                
                if let posterPath = jsonDictionary["poster_path"] as? String {
                    //print(posterPath)
                    
                    self.posterPath = "http://image.tmdb.org/t/p/w500\(posterPath)"
                    
                } else {
                    print("I couldnt parse the PosterPath")
                }
                
                if let title = jsonDictionary["original_title"] as? String {
                    //print(title)
                    
                    self.title = title
                    
                } else {
                    print("I couldnt parse the title")
                }
                
            }
        }
        
        // Create an Array of Movies
        
        var moviesArray = [Movie]()
        
        // 2 load the json file into an nsurl
        
        if let filePath = NSBundle.mainBundle().URLForResource("popular", withExtension: "json") {
            
            // 2. Create the NSURL to NSData
            
            if let data = NSData(contentsOfURL: filePath) {
                
                do {
                    
                    // LEVEL 1
                    if let jsonDict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                        
                        // LEVEL 2
                        if let resultsArray = jsonDict["results"] as? JSONArray {
                            
                            // Level 2
                            for resultsDict in resultsArray {
                                
                                var theMovie = Movie(jsonDictionary: resultsDict)
                                moviesArray.append(theMovie)
                            }
                            
                        } else {
                            print("I cant parse the results")
                        }
                        
                    } else {
                        
                        print("I cant parse the dictionary")
                        
                    }
                    
                } catch {
                    print("I could not parse the json data")
                }
                
            }
            
        } else {
            
            print("I could not the file.")
            
        }
        
        print(moviesArray.count)
        
        for theMovie in moviesArray {
            
            print(theMovie.title)
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        return cell
    }

}