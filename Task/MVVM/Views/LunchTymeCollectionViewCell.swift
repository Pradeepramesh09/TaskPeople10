//
//  LunchTymeCollectionViewCell.swift
//  Task
//
//  Created by Pradeep_Ramesh on 27/05/20.
//  Copyright © 2020 Pradeep ramesh. All rights reserved.
//

import UIKit

class LunchTymeCollectionViewCell: UICollectionViewCell {
    
    
    //MARK:- Outlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var catLbl: UILabel!
    
    //MARK:- Configure cell
    func configureCell(index:Int){
        let restaurant = RestViewModel.resturants[index]
        
        imgView.load(urlString: restaurant.backgroundImageURL ?? "")
        nameLbl.text = restaurant.name ?? ""
        catLbl.text = restaurant.category ?? ""
        
    }
    
    // - Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animate(isHighlighted: true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animate(isHighlighted: false)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animate(isHighlighted: false)
    }
    
    // - Private functions
     func animate(isHighlighted: Bool, completion: ((Bool) -> Void)?=nil) {
        let animationOptions: UIView.AnimationOptions = [.allowUserInteraction]
        
        if isHighlighted {
            UIView.animate(withDuration: 0.4,
                           delay: 0,
                           usingSpringWithDamping: 1.1,
                           initialSpringVelocity: 0.1,
                           options: animationOptions, animations: {
                            self.transform = .init(scaleX: 0.96, y: 0.96)
            }, completion: completion)
            
        } else {
            UIView.animate(withDuration: 0.4,
                           delay: 0,
                           usingSpringWithDamping: 1.1,
                           initialSpringVelocity: 0.1,
                           options: animationOptions, animations: {
                            self.transform = .identity
            }, completion: completion)
        }
    }
    
}
