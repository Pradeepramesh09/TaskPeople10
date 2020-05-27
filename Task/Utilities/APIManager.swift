//
//  APIManager.swift
//  Task
//
//  Created by Apple retina on 26/05/20.
//  Copyright © 2020 Pradeep ramesh. All rights reserved.
//

import Foundation

typealias methodType = APIManager.HttpMethods
typealias CompletionHandler = (_ resultObject: Any?, _ success: Bool, _ error: Error?, _ data: Data?) -> Void

class APIManager {
    
    enum HttpMethods: String {
        case POST = "POST"
        case GET = "GET"
        case PUT = "PUT"
        case DELETE = "DELETE"
    }
    
   //MARK:- Get request
   static func getRequest(fileName: String,
                    httpMethod: methodType,
                    handler: @escaping CompletionHandler) -> Void {
    // generating url...
    let urlString = "\(Service.base_url)\(fileName)"
    
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if let err = error{
            handler(nil, false, error as NSError?, data)
            print("Loading data error: \(err.localizedDescription)")
        }else{
            
            do {
                let result = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                handler(result, true, error as NSError?, data)
            } catch {
                print("\(String(describing: response?.url)) : \(String(decoding: data ?? Data(), as: UTF8.self))")
                handler(nil, false, error as NSError?, data)
            }
            
        }
        }.resume()
    
    }
}
