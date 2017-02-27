//
//  LoginViewController.swift
//  FaceIt
//
//  Created by Dimitrije Maric on 2/12/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    
    var firstName = "<firstname>"
    var lastName = "<lastName>"
    
   
    @IBOutlet weak var firstNameField: UITextField!
    
    
    @IBOutlet weak var lastNameField: UITextField!
    
    
    @IBOutlet weak var rightArrowImage: UIImageView!
   
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        
        
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedToRight))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        swipeRight.isEnabled = true
        rightArrowImage.addGestureRecognizer(swipeRight)
        rightArrowImage.isUserInteractionEnabled = true
        
    }

    func swipedToRight(gesture:UISwipeGestureRecognizer){
     performSegue(withIdentifier: Segues.help, sender: gesture.view)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func login(_ sender: Any) {
        //todo
        
    }
    
    private struct Segues
    {
        static let chooseGame = "fromLoginToGames"
        static let help = "fromLoginToHelp"
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segues.chooseGame
        {
            let firstName =  (firstNameField.text?.isEmpty)! ? "<firstName>" : firstNameField.text
            let lastName = (lastNameField.text?.isEmpty)! ? "<lastName>" : lastNameField.text
            
            if let navigationVC = segue.destination as? UINavigationController
            {
                if let chooseGameVC = navigationVC.topViewController as? ChooseGameViewController
                    {
                        chooseGameVC.nameLabelText = firstName!  + " " + lastName!                    }
            }
            
        }
    }
  

}
