//
//  StarWarsTableViewController.swift
//  18 StarWars
//
//  Created by Joe Moss on 6/15/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class StarWarsTableViewController: UITableViewController {
    
    var starWarsArray = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    return characterData()

    }

    func characterData() {
    
        let luke = Character(name: "Luke Skywalker", imageName: "skywalker")
        self.starWarsArray.append(luke)
        
        let ben = Character(name: "Obi-Wan Kenobi", imageName: "kenobi")
        self.starWarsArray.append(ben)
        
        let r2 = Character(name: "R2-D2", imageName: "r2")
        self.starWarsArray.append(r2)
        
        let tarkin = Character(name: "Grand Moff Tarkin", imageName: "tarkin")
        self.starWarsArray.append(tarkin)
        
        let darth = Character(name: "Darth Vader", imageName: "vader")
        self.starWarsArray.append(darth)
        
        let leia = Character(name: "Princess Leia Organa", imageName: "organa")
        self.starWarsArray.append(leia)
        
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.starWarsArray.count
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CharacterTableViewCell
        
        let char = self.starWarsArray[indexPath.row]
        
        cell.nameLabel.text = char.name
        
        cell.imageViewName.image = UIImage(named: char.imageName)
        
        return cell
    }

}
