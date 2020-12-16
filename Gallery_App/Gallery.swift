//
//  Gallery.swift
//
//  Created by Roman Kantor on 2020-10-22.
//  Copyright © 2020 Roman Kantor. All rights reserved.
//

import Foundation
import UIKit


class Gallery : UIViewController{
    var imageData : Data?
    
    var images = ["https://images.freeimages.com/images/large-previews/68c/delicate-arch-2-1391623.jpg", "https://images.freeimages.com/images/large-previews/72c/fox-1522156.jpg", "https://images.freeimages.com/images/large-previews/321/water-drop-1386547.jpg", "https://images.freeimages.com/images/large-previews/bff/playa-de-portimao-1640388.jpg", "https://images.freeimages.com/images/large-previews/693/beatiful-1641351.jpg"
        ]
    
    // downloads the image in a seperate thread
    func getImage(i:Int, handler : @escaping (Data)->Void){
        let url : URL = URL(string: images[i])!
        
        let newThread = DispatchQueue.init(label: "myThread")
        newThread.async {
            do {
                self.imageData = try Data(contentsOf: url)
                if let data = self.imageData{
                    // call the completion handler
                    handler(data)
                }
            }catch{
                print("Something wrong with the image download")
            }
        }
               
    }
}

