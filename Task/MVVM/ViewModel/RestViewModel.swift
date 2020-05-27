//
//  RestViewModel.swift
//  Task
//
//  Created by Pradeep_Ramesh on 26/05/20.
//  Copyright © 2020 Pradeep ramesh. All rights reserved.
//

import UIKit

typealias UniqueHandler = () -> Void
typealias UniqueMsgHandler = (_ message: String) -> Void

class RestViewModel: NSObject {
    
    static var resturants : [RestaurantsModel] = []
    static var selectedIndex:Int = -1
    
}

extension RestViewModel{
   
    //MARK:- API calls
    static func getRestaurants(handler: @escaping UniqueHandler){
        
        APIManager.getRequest(fileName: Service.kGetRestaurants, httpMethod: .GET, handler: { (resultObj, success, error, data) in
            
            guard let response_data = data else { return }

            do{
                
                let results = try JSONDecoder().decode(ResponseModel.self, from: response_data)
                RestViewModel.resturants = results.restaurants
                
                handler()
                
            }catch let jsonErr{
                print("json error : \(jsonErr.localizedDescription)")
            }
            
        })
    }
    
}
