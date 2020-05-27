//
//  LunchTymeDetailsViewController.swift
//  Task
//
//  Created by Pradeep_Ramesh on 26/05/20.
//  Copyright © 2020 Pradeep ramesh. All rights reserved.
//

import UIKit
import MapKit

class LunchTymeDetailsViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var hotelNmlbl: UILabel!
    @IBOutlet weak var catLbl: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var twitterLbl: UILabel!
    
    
    //MARK:- View Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = RestViewModel.resturants[RestViewModel.selectedIndex]
                
        hotelNmlbl.text = data.name ?? ""
        catLbl.text = data.category ?? ""
        addressLbl.text = ("\(data.location?.formattedAddress ?? [""])")
        phoneLbl.text = ("\(data.contact?.formattedPhone ?? "")")
        twitterLbl.text = ("@\(data.contact?.twitter ?? "")")
        
        self._loadFooter()

    }

}

extension LunchTymeDetailsViewController{
    
    private func _loadFooter(){
        
        let footerView = storyboard!.instantiateViewController(withIdentifier: "FooterViewController") as! FooterViewController
        addChild(footerView)
        let theHeight = view.frame.size.height
        footerView.view.frame = CGRect(origin: CGPoint(x: 0, y: theHeight - 60), size: CGSize(width: self.view.frame.width, height: 60))
        footerView.lunchbtn.isUserInteractionEnabled = false
        footerView.lunchLbl.textColor = UIColor.init(red: 67/255, green: 232/255, blue: 149/255, alpha: 1)
        footerView.lunchIngView.image = UIImage(named: "lunchselected")
        view.addSubview(footerView.view)
        footerView.didMove(toParent: self)

    }
}

