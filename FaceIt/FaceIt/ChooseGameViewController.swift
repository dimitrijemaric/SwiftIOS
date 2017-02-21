//
//  ChooseGameViewController.swift
//  FaceIt
//
//  Created by Dimitrije Maric on 2/12/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit

class ChooseGameViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    var nameLabelText = "<name>"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Hi " + nameLabelText + ", choose a game to play"
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tapGameDestinationVC = segue.destination as! TapGameViewController
            tapGameDestinationVC.nameLabelText = nameLabelText
        
        if segue.identifier == "fromGamesToFaceGame"
            {
                tapGameDestinationVC.imageType = .Face
                tapGameDestinationVC.imageSize = (80, 80)
                tapGameDestinationVC.imagePositionOffset = (40, 40)
            }
            
        else if segue.identifier == "fromGamesToBoxGame"
            {
                tapGameDestinationVC.imageType = .Box
                tapGameDestinationVC.imageSize = (width: 40, height: 40)
                tapGameDestinationVC.imagePositionOffset = (x: 20, y: 20)
            }
    
    }
}
