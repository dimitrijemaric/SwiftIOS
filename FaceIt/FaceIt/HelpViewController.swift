//
//  HelpViewController.swift
//  FaceIt
//
//  Created by Dimitrije Maric on 2/26/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipedToLeft))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        swipeLeft.isEnabled = true
        leftArrowImage.isUserInteractionEnabled = true
        leftArrowImage.addGestureRecognizer(swipeLeft)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipedToLeft(gesture:UISwipeGestureRecognizer)     {
        performSegue(withIdentifier: Segues.login, sender: gesture.view)
        }

    @IBOutlet weak var leftArrowImage: UIImageView!
    
    
    private struct Segues
            {
                static let login = "fromHelpToLogin"
            }

}
