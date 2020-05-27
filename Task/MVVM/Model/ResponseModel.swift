//
//  ResponseModel.swift
//  Task
//
//  Created by Pradeep_Ramesh on 26/05/20.
//  Copyright © 2020 Pradeep ramesh. All rights reserved.
//

import Foundation

struct ResponseModel: Codable {
    
   var restaurants = [RestaurantsModel]()

    enum CodingKeys: String, CodingKey {
        case restaurants
    }

}


struct RestaurantsModel: Codable {
    
    var name: String?
    var category: String?
    var backgroundImageURL : String?
    
    var contact: ContactModel?
    var location: LocationModel?
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case category
        case backgroundImageURL
        case contact
        case location
    }
    
}

struct ContactModel: Codable {

    var phone : String?
    var formattedPhone : String?
    var twitter : String?

    enum CodingKeys: String, CodingKey {
        case phone
        case formattedPhone
        case twitter
    }

}

struct LocationModel: Codable {
    
    var address: String?
    var crossStreet : String?
    var postalCode : String?
    var cc : String?
    var city : String?
    var state : String?
    var country : String?
    var formattedAddress : [String]?
    
    
    enum CodingKeys: String, CodingKey {
        case address
        case crossStreet
        case postalCode
        case cc
        case city
        case state
        case country
        case formattedAddress

    }

}


