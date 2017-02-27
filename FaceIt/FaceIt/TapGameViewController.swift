//
//  FaceGameViewController.swift
//  FaceIt
//
//  Created by Dimitrije Maric on 2/12/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit

class TapGameViewController: UIViewController
{
    var imageType : ImageType = .Default
    var imagePositionOffset: (x: CGFloat, y: CGFloat) = (CGFloat(0.0),CGFloat(0.0))
    var imageSize: (width: CGFloat, height: CGFloat) = (CGFloat(0.0),CGFloat(0.0))
    var nameLabelText = "<name>"
    var imageCountLabelText = "Number of images: 0"
    var imageCount = 0 {didSet{imageCountLabel.text = "Number of images: " + String(imageCount)}}
    
    
   
   
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageCountLabel: UILabel!
    
    
    @IBOutlet weak var playgroundView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nameLabelText
        imageCountLabel.text = imageCountLabelText
    }
    
    func drawNewImageInView (view: UIView,
                             newImageCenter: CGPoint)
    {
        
        let newImage = ImageView(frame: CGRect(x: newImageCenter.x - imagePositionOffset.x,
                                               y: newImageCenter.y - imagePositionOffset.y,
                                               width: imageSize.width,
                                               height: imageSize.height))
        
       
        
        if imageType == .Face
            {
                newImage.imageType = .Face
                PrepareFaceForDrawing(faceToDraw: newImage)
            }
            
        else if imageType == .Box
            {
                newImage.imageType = .Box
                newImage.backgroundColor = getRandomColor()
            }
        else
            {
                print("image type not implemented")
            }
        
        
        if (IsNewImageInsidePlayground(newImage, playgroundView)){
            
                playgroundView.addSubview(newImage)
                imageCount+=1
                addGestureOnImage(image: newImage)}
        
        
    }
    
    func addGestureOnImage(image: UIView)
        {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeImageOnTap))
            
            image.addGestureRecognizer(tapGesture)
        }

    func IsNewImageInsidePlayground(_ newImage: UIView, _ playgroundView: UIView) -> Bool
    {
        if (newImage.frame.origin.x >= 0 && newImage.frame.origin.x + newImage.frame.width < playgroundView.bounds.maxX && newImage.frame.origin.y >= 0 && newImage.frame.origin.y + newImage.frame.height < playgroundView.bounds.maxY)
        {
         return true
        }
        else {return false}
    }
    
    func removeImageOnTap(_ recognizer: UITapGestureRecognizer)
        {
            recognizer.view?.removeFromSuperview()
            imageCount-=1
        }


    func PrepareFaceForDrawing (faceToDraw: ImageView)
    {
        faceToDraw.backgroundColor = UIColor.clear
        faceToDraw.color = getRandomColor()
        
        let randomFace = getRandomFace()
        
        faceToDraw.eyeBrowTilt = randomFace.eyeBrow.rawValue
        faceToDraw.eyesOpen = Bool.convertFromInt(int: randomFace.eye.rawValue)
        faceToDraw.mouthCurvature = randomFace.mouth.rawValue

    }
    
    func getRandomColor() -> UIColor
    {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    func getRandomFace() -> Face
    {
        
        let randomMouthCurvatureValue = getRandomArrayMember(targetArray:mouthCurvatureValues) 
        let randomEyeOpenedValue = getRandomArrayMember(targetArray: eyeOpenedValues) 
        let randomEyeBrowTiltValue = getRandomArrayMember(targetArray: eyeBrowTiltValues) 
        
        
        return Face(mouth: Mouth(rawValue: randomMouthCurvatureValue)!,
                          eye: Eye(rawValue:randomEyeOpenedValue)!,
                          eyeBrow: EyeBrow(rawValue:randomEyeBrowTiltValue)!
        )
    }
    
    func getRandomArrayMember<T>(targetArray: Array<T>) -> T
    {
        return targetArray[Int(arc4random_uniform(UInt32(targetArray.count)))]
    }
    
    
    @IBAction func tapAction(_ recognizer: UITapGestureRecognizer)
    {
        if recognizer.state == .ended
        {
            let tapCenterPoint = recognizer.location(in: playgroundView)
            
            drawNewImageInView(view: playgroundView, newImageCenter: tapCenterPoint)
        }
    
    }
    
    func didUserTapOnExistingImage(_ subview: UIView,
                                  _ tapCenterPoint: CGPoint) -> Bool
    {
        if subview.frame.contains(tapCenterPoint) {return true}
        else {return false}
    }
    
}
extension Bool
{
    static func convertFromInt(int: Int) -> Bool
    {
        if int == 0 {return false}
        else {return true}
    }
}
