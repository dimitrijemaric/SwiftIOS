//
//  LoginViewController.swift
//  FaceIt
//
//  Created by Dimitrije Maric on 2/12/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    var firstName = "<firstname>"
    var lastName = "<lastName>"
    
    @IBAction func lastNameEdited(_ field: UITextField) {
        
        lastName = field.text!
        
    }
    
    @IBAction func firstNameEdited(_ field: UITextField) {
        
        firstName = field.text!
    }
   
    @IBAction func login(_ sender: Any) {
        //todo
        
    }
    
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "fromLoginToGames"
        {
            let navigationVC = segue.destination as! UINavigationController
            let gamesVC = navigationVC.topViewController as! ChooseGameViewController
            gamesVC.nameLabelText = firstName + " " + lastName
        }
    }
  

}
