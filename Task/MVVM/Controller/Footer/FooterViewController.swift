//
//  FooterViewController.swift
//  Fisdom
//
//  Created by Pradeep_Ramesh on 04/05/20.
//  Copyright © 2020 Pradeep ramesh. All rights reserved.
//

import UIKit
import SafariServices

class FooterViewController: UIViewController, SFSafariViewControllerDelegate {

    //MARK:- IBOutlets
    @IBOutlet weak var lunchIngView: UIImageView!
    @IBOutlet weak var lunchLbl: UILabel!
    @IBOutlet weak var lunchbtn: UIButton!
    
    @IBOutlet weak var internetImgView: UIImageView!
    @IBOutlet weak var internetLbl: UILabel!
    @IBOutlet weak var internetBtn: UIButton!
    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    //MARK: - Footer button actions
    
    @IBAction func tapFooterBtn(_ sender: UIButton) {
        
        if sender.tag == 1{
            
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LunchTimeViewController") as? LunchTimeViewController
            self.navigationController?.pushViewController(vc!, animated: false)
            self.viewWillAppear(true)
            
        }else if sender.tag == 2{
            
            let safariVC = SFSafariViewController(url: NSURL(string: "https://www.bottlerocketstudios.com")! as URL)
            self.present(safariVC, animated: true, completion: nil)
            safariVC.delegate = self

        }
 
    }
    
}

