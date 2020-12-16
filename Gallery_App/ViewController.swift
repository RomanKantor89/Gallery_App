//
//  ViewController.swift
//
//  Created by Roman Kantor on 2020-10-22.
//  Copyright © 2020 Roman Kantor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    var myGallery: Gallery?
    var i = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // swipe left gesture setup
        let swipeLeftGesture=UISwipeGestureRecognizer(target: self, action: #selector(SwipeLeft))
         imageView.isUserInteractionEnabled=true
        swipeLeftGesture.direction = UISwipeGestureRecognizer.Direction.left
        imageView.addGestureRecognizer(swipeLeftGesture)

        // swipe right gesture setup
         let swipeRightGesture=UISwipeGestureRecognizer(target: self, action: #selector(SwipeRight))
        swipeRightGesture.direction = UISwipeGestureRecognizer.Direction.right
         imageView.addGestureRecognizer(swipeRightGesture)
        
        // initial imge
        downloadImage(i: i)
    }
    
    //implementing protocle function
    func downloadImage(i: Int){
        myGallery?.getImage(i: i){ imageData in
            DispatchQueue.main.async {
              print("inside completion handler ")
                self.imageView.image = UIImage(data: imageData)
              
            }
        }
    }

    @objc func SwipeLeft(){
        i = i < (myGallery?.images.count)!-1 ? i+1 : 0
        downloadImage(i: i)
    }
       
    @objc func SwipeRight(){
        i = i <= (myGallery?.images.count)!-1 && i > 0 ? i-1 : (myGallery?.images.count)!-1
        downloadImage(i: i)

    }
    
    // arrow buttons functionallity
    @IBAction func arrowClicked(_ sender: UIButton) {
        if sender.currentTitle == "<" {
            SwipeRight()
        }
        else{
            SwipeLeft()
        }
    }

}

