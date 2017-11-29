//
//  ViewController.swift
//  Like Button
//
//  Created by Sanket  Ray on 29/11/17.
//  Copyright © 2017 Sanket  Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var liked : Bool = false

    @IBOutlet weak var image: UIImageView!
    
    var heartImages = [UIImage]()
    var undoHeart = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        heartImages = createImageArray(total: 24, imagePrefix: "heart")
        undoHeart = reverseImageArray(total: 24, imagePrefix: "heart")
        
    }

    @IBAction func startAnimation(_ sender: UIButton) {

        if !liked {
            animateHeart(heartImages) { (image) in
                self.image.image = image
                self.liked = true
                print("complete")
            }
        }else if liked {
            print("need to animte back")
            animateHeart(undoHeart, completion: { (image) in
                self.image.image = image
                self.liked = false
            })
        }
    }
    

    func createImageArray (total : Int, imagePrefix : String) -> [UIImage] {
        var imageArray : [UIImage] = []
        for imageCount in 0..<total {
            let imageName = "\(imagePrefix)-\(imageCount).png"
            let image = UIImage(named: imageName)!
            imageArray.append(image)
        }
        return imageArray
    }
    func reverseImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        var imageArray: [UIImage] = []
        for imageCount in (0..<total).reversed() {
            let imageName = "\(imagePrefix)-\(imageCount).png"
            let image = UIImage(named: imageName)!
            imageArray.append(image)
        }
        return imageArray
    }
    
    func animateHeart(_ imageArray : [UIImage],completion: @escaping (_ image : UIImage?)->Void) {
        
        image.animationImages = imageArray
        image.animationDuration = 1
        image.animationRepeatCount = 1
        completion(imageArray.last!)
        image.startAnimating()
        
    }

}

