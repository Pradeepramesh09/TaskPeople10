//
//  Service.swift
//  Task
//
//  Created by Pradeep_Ramesh on 26/05/20.
//  Copyright © 2020 Pradeep ramesh. All rights reserved.
//

import UIKit

let MainStoryboard = UIStoryboard(name: "Main", bundle: nil)

class Service: NSObject {

    //Base url
    static let base_url = "https://s3.amazonaws.com/br-codingexams/"
    
    //Api's
    static let kGetRestaurants = "restaurants.json"
    
}
