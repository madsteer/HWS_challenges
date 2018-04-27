//
//  Storm.swift
//  StormViewer
//
//  Created by Cory Steers on 4/23/18.
//  Copyright © 2018 Cory Steers. All rights reserved.
//

import UIKit

class Storm: NSObject {

    var name: String
    var image: String

    init(name: String, image: String) {
        self.name = name
        self.image = image
    }

}
