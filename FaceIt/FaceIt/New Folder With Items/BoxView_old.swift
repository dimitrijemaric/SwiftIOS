//
//  BoxView.swift
//  FaceIt
//
//  Created by Dimitrije Maric on 2/16/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit

class BoxView: UIView {

    
    var color = UIColor.clear
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override public func draw(_ rect: CGRect) {
        // Drawing code
        color.setFill()
        let rectangleFrame = UIBezierPath(rect: rect)
        rectangleFrame.stroke()
        
    }
    

}
