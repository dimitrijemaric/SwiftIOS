//
//  Face.swift
//  FaceIt
//
//  Created by Dimitrije Maric on 2/15/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import Foundation

public struct Face {

    var mouth: Mouth
    var eye: Eye
    var eyeBrow: EyeBrow
    

}


public let mouthCurvatureValues = [-1.0, 0.0, 1.0]
public let eyeOpenedValues = [0, 1]
public let eyeBrowTiltValues = [-0.5, 0.0, 0.5]

enum Mouth: Double{
    case Smile = 1
    case Sad = -1
    case Neutral = 0
    
    
       }



enum EyeBrow: Double{

    case Angry = -0.5
    case Relaxed = 0.5
    case Neutral = 0.0
    
    
    
}

enum Eye: Int{

    case Open = 0
    case Closed = 1
    
    }

public enum ImageType
{
    case Face
    case Box
    case Default
}

