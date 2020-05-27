//
//  LunchTimeViewController.swift
//  Task
//
//  Created by Pradeep_Ramesh on 26/05/20.
//  Copyright © 2020 Pradeep ramesh. All rights reserved.
//

import UIKit

class LunchTimeViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK:- Footer View
    var footerView = FooterViewController()

    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        getRestaurantsAPICall()
        self._loadFooter()

    }

}

extension LunchTimeViewController{
    
    //MARK:- API'S
    private func getRestaurantsAPICall(){
        
        self.activityIndicator.startAnimating()

        RestViewModel.getRestaurants {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }

    }
    
    //MARK:- Load Footer
    
    
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

extension LunchTimeViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RestViewModel.resturants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LunchTimeTableView", for: indexPath) as! LunchTimeTableView
        cell.configureCell(index: indexPath.row)
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        RestViewModel.selectedIndex = indexPath.row
        
        let vc = MainStoryboard.instantiateViewController(withIdentifier: "LunchTymeDetailsViewController") as! LunchTymeDetailsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}



class LunchTimeTableView: UITableViewCell{
    
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var catLbl: UILabel!
   
    
    //MARK:- Configure cell
    func configureCell(index:Int){
        let restaurant = RestViewModel.resturants[index]
        
        ImgView.load(urlString: restaurant.backgroundImageURL ?? "")
        nameLbl.text = restaurant.name ?? ""
        catLbl.text = restaurant.category ?? ""
        
    }
    
}
