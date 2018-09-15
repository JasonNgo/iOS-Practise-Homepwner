//
//  Item.swift
//  Homepwner
//
//  Created by Jason Ngo on 2018-07-17.
//  Copyright © 2018 Jason Ngo. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    let imageKey: String

    init(name: String, valueInDollars: Int, serialNumber: String?) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        dateCreated = Date()
        imageKey = UUID().uuidString

        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        valueInDollars = aDecoder.decodeInteger(forKey: "valueInDollars")
        serialNumber = aDecoder.decodeObject(forKey: "serialNumber") as! String?
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        imageKey = aDecoder.decodeObject(forKey: "imageKey") as! String

        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(valueInDollars, forKey: "valueInDollars")
        aCoder.encode(serialNumber, forKey: "serialNumber")
        aCoder.encode(dateCreated, forKey: "dateCreated")
        aCoder.encode(imageKey, forKey: "imageKey")
    }

    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]

            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]

            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]

            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!

            self.init(name: randomName, valueInDollars: randomValue, serialNumber: randomSerialNumber)

        } else {
            self.init(name: "", valueInDollars: 0, serialNumber: nil)
        }
    }
    
} // Item
