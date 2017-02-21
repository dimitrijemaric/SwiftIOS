//
//  Square.swift
//  FaceIt
//
//  Created by Dimitrije Maric on 2/17/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit

class BoxView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override public func draw(_ rect: CGRect) {
        // Drawing code
        
        let rectangleOuterLines = UIBezierPath(rect: rect)
        rectangleOuterLines.stroke()
        
    }

}
