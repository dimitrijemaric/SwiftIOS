//
//  SquareViewController.swift
//  FaceIt
//
//  Created by Dimitrije Maric on 2/17/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit

class BoxViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var boxCountLabel: UILabel!
    
    
    var nameLabelText = "<name>"
    var boxCountLabelText = "Number of boxes: 0"
    var boxCount = 0 {didSet{boxCountLabel.text = "Number of boxes: " + String(boxCount)}}
    

    
    @IBAction func tapAction(_ recognizer: UITapGestureRecognizer)
    {
    
        if recognizer.state == .ended
            {
                                let tapCenterPoint = recognizer.location(in: view)
                var subViewRemoved = false
                let allBoxesInView = view.subviews
                
                
                for singleFace in allBoxesInView
                {
                    if didUserTapOnExistingImage(singleFace, tapCenterPoint)
                    {
                        singleFace.removeFromSuperview()
                        subViewRemoved = true
                        boxCount-=1
                        break
                    }
                }
                
                if (subViewRemoved == false)
                {
                    drawNewBox(tapCenter: recognizer.location(in: view))
                    boxCount+=1
                }

            }
    }
    
    func drawNewBox(tapCenter: CGPoint)
    {
        let newBox = ImageView(frame: CGRect(x: tapCenter.x - 20,
                                           y: tapCenter.y - 20,
                                           width: CGFloat(40),
                                           height: CGFloat(40)))
        
        newBox.backgroundColor = getRandomColor()
        view.addSubview(newBox)
    }
    
    func getRandomColor() -> UIColor
    {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }

    
}
