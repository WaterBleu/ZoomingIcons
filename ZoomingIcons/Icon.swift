//
//  Icon.swift
//  ZoomingIcons
//
//  Created by Jeff Huang on 2015-08-06.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

import UIKit

class Icon: NSObject {
    var image:UIImage!
    var imageTitle:String!
    var imageDescription:String!
    var imageBackgroundColor:UIColor!
    
    init(image: UIImage, imageTitle: String, imageDescription: String, imageBackgroundColor:UIColor){
        self.image = image
        self.imageTitle = imageTitle
        self.imageDescription = imageDescription
        self.imageBackgroundColor = imageBackgroundColor
    }
}
