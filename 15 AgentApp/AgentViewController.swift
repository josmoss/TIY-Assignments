//
//  AgentViewController.swift
//  15 AgentApp
//
//  Created by Joe Moss on 6/13/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class AgentViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var authButton: UIButton!
    @IBOutlet weak var greetingLabel: UILabel!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == userTextField {
            passwordTextField.becomeFirstResponder()
            
        } else {
            textField.resignFirstResponder()
        }
        return true
    }

    @IBAction func authTapped(sender: UIButton) {
        
        let secretAgent = "Moss"
        
        if (self.userTextField.text! == "Joe") && (self.passwordTextField.text! == "password") {
            
            self.view.backgroundColor = UIColor.greenColor()
            self.greetingLabel.text = "Good Evening, Agent \(secretAgent)"
            
        }
        
        else {
            
            self.view.backgroundColor = UIColor.redColor()
            
        }
        
    }

}
