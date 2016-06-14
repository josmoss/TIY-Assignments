//
//  ViewController.swift
//  17 Back In Time
//
//  Created by Joe Moss on 6/14/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var destDateTextBox: UITextField!
    @IBOutlet weak var presentDateLabel: UILabel!
    @IBOutlet weak var lastDateDepartLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var travelBackButton: UIButton!
    
    //MARK - create date formatter and set the format
    let formattedDate = NSDateFormatter()
    
    //MARK - create global variable
    var milesPerHour = 0
    var timer:NSTimer?
    
    // grabbed today's date
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.formattedDate.dateFormat = "MMM d, yyyy"
        
        let today : NSDate = NSDate()
        print(today)
        //print(today)
        
        self.presentDateLabel.text = self.formattedDate.stringFromDate(today)
        
    }

    //MARK - date entered convert to string
    
    func enteredDate() {
        // use if statement to make sure that something exists inside the variable
        
        formattedDate.dateFormat = "MMddyyyy"
        if let dateEntered = self.destDateTextBox.text {
        
            if let theDate = self.formattedDate.dateFromString(dateEntered) {
        
                self.formattedDate.dateFormat = "MMM d, yyyy"
                self.destDateTextBox.text = self.formattedDate.stringFromDate(theDate)
        }
      }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        enteredDate()
        self.destDateTextBox.resignFirstResponder()
        
        return true
    }
    
    func updateMiles() {
        self.milesPerHour += 1
        if milesPerHour >= 88 {
            self.timer?.invalidate()
            self.performSegueWithIdentifier("PopupSegue", sender: self)
        }
            self.counterLabel.text = "\(milesPerHour) MPH"
        
    }
    
    func reset() {
        
        self.lastDateDepartLabel.text = "-- -- ----"
        self.destDateTextBox.text = ""
        milesPerHour = 0
        self.counterLabel.text = "0 MPH"
        
    }
 
    // MARK - Actions
    
    @IBAction func unwindSegue (segue: UIStoryboardSegue) {
        
        reset()
    
    }
    
    @IBAction func travelBackButton(sender: UIButton) {
        
       self.lastDateDepartLabel.text = self.presentDateLabel.text
        self.milesPerHour = 0
        let speed = 0.1
        
        self.timer = NSTimer .scheduledTimerWithTimeInterval(speed, target: self, selector: #selector(updateMiles), userInfo: nil, repeats: true)
        
    }

}