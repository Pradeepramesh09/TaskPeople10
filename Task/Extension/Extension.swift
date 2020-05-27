//
//  Extension.swift
//  Task
//
//  Created by Pradeep_Ramesh on 26/05/20.
//  Copyright © 2020 Pradeep ramesh. All rights reserved.
//

import Foundation
import UIKit


var imagecahce = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func load(urlString : String) {
        
        if let image = imagecahce.object(forKey: urlString as NSString) as? UIImage{
            
            self.image = image
            return
            
        }
        
        guard let url = URL(string: urlString)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imagecahce.setObject(image, forKey: urlString as NSString)
                        self?.image = image
                    }
                }
            }
        }
    }
}
