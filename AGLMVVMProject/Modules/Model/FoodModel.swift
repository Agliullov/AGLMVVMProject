//
//  FoodModel.swift
//  AGLMVVMProject
//
//  Created by Раис Аглиуллов on 22.11.2020.
//

import UIKit

struct Food {
    let name: String
    let flickerID: String
    let image: UIImage?
    
    init(name: String, flickerID: String) {
        self.name = name
        self.flickerID = flickerID
        image = UIImage(named: flickerID)
    }
}

extension Food: CustomStringConvertible {
    var description: String {
        return "\(name): flicker.com/\(flickerID)"
    }
}
