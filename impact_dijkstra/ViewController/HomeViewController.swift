//
//  ViewController.swift
//  impact_dijkstra
//
//  Created by Carl Gombert on 11/13/23.
//

import UIKit

class HomeViewController: UIViewController {

    var subTitleLabel = UILabel()
    var titleLabel = UILabel()
    var continueButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        subTitleLabel.text = "the impact of"
        subTitleLabel.font = UIFont(name: "Futura-CondensedMedium", size: 0.0625*width)
        subTitleLabel.textColor = UIColor.white
        subTitleLabel.textAlignment = .center
        subTitleLabel.frame = CGRect(x: width*0.5-width*0.4, y: height*0.25-height*0.025, width: width*0.8, height: height*0.05)
        
        
        titleLabel.text = "DIJKSTRA'S ALGORITHM"
        titleLabel.font = UIFont(name: "Futura-CondensedExtraBold", size: 0.1145*width)
        titleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.frame = CGRect(x: width*0.5-width*0.4, y: height*0.35-height*0.075, width: width*0.8, height: height*0.20)
        
        
        continueButton.setTitle("continue", for: .normal)
        continueButton.addTarget(continueNext, action: #selector(HomeViewController.continueNext), for: UIControl.Event.touchUpInside)
        continueButton.titleLabel?.font = UIFont(name: "Futura-CondensedMedium", size: 0.0625*width)
        continueButton.frame = CGRect(x: width*0.5-width*0.4, y: height*0.9-height*0.025, width: width*0.8, height: height*0.05)
        
        view.addSubview(subTitleLabel)
        view.addSubview(titleLabel)
        view.addSubview(continueButton)
        
    }
    
    @objc func continueNext(){
        performSegue(withIdentifier: "introGraph", sender: self)
    }


}

