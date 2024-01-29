//
//  ImpactDtraViewController.swift
//  impact_dijkstra
//
//  Created by Carl Gombert on 11/21/23.
//

import Foundation
import UIKit

class ImpactDstraViewController : UIViewController{
    
    var width = 0.0
    var height = 0.0
    var textUtil = TextUtil()
    var titleLabel = UILabel()
    var continueButton = UIButton()
    var skipButton = UIButton()
    var textView = UILabel()
    var pageText: [String] = []
    var currPage = 0
    var nextButton = UIButton()
    var backButton = UIButton()
    var continueNextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        width = view.frame.size.width
        height = view.frame.size.height
        
        pageText = textUtil.impactDtraText
        
        titleLabel.text = "The Impact of Dijkstra's Algorithm"
        titleLabel.font = UIFont(name: "Futura-CondensedMedium", size: 0.1145*width)
        titleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.frame = CGRect(x: width*0.5-width*0.4, y: height*0.35-height*0.075, width: width*0.8, height: height*0.20)
        
        skipButton.setTitle("skip", for: .normal)
        skipButton.tintColor = UIColor.darkGray
        skipButton.addTarget(skip, action: #selector(ImpactDstraViewController.skip), for: UIControl.Event.touchUpInside)
        skipButton.titleLabel?.font = UIFont(name: "Futura-CondensedMedium", size: 0.0625*width)
        skipButton.frame = CGRect(x: width*0.5-width*0.4, y: height*0.9-height*0.025, width: width*0.8, height: height*0.05)
        
        continueButton.setTitle("continue", for: .normal)
        continueButton.tintColor = UIColor.darkGray
        continueButton.addTarget(continueNext, action: #selector(ImpactDstraViewController.continueNext), for: UIControl.Event.touchUpInside)
        continueButton.titleLabel?.font = UIFont(name: "Futura-CondensedMedium", size: 0.0625*width)
        continueButton.frame = CGRect(x: width*0.5-width*0.4, y: height*0.85-height*0.025, width: width*0.8, height: height*0.05)
        
        textView.font = UIFont(name: "Futura-CondensedMedium", size: 0.0545*width)
        textView.lineBreakMode = NSLineBreakMode.byWordWrapping
        textView.numberOfLines = 0
        textView.textAlignment = .center
        textView.textColor = UIColor.white
        textView.frame = CGRect(x: width*0.5-width*0.4, y: height*0.4-height*0.35, width: width*0.8, height: height*0.7)
        
        nextButton.setTitle("next >", for: .normal)
        nextButton.tintColor = UIColor.darkGray
        nextButton.addTarget(nextPage, action: #selector(ImpactDstraViewController.nextPage), for: UIControl.Event.touchUpInside)
        nextButton.titleLabel?.font = UIFont(name: "Futura-CondensedMedium", size: 0.0625*width)
        nextButton.frame = CGRect(x: width*0.75-width*0.25, y: height*0.9-height*0.025, width: width*0.5, height: height*0.05)
        
        backButton.setTitle("< back", for: .normal)
        backButton.tintColor = UIColor.darkGray
        backButton.addTarget(backPage, action: #selector(ImpactDstraViewController.backPage), for: UIControl.Event.touchUpInside)
        backButton.titleLabel?.font = UIFont(name: "Futura-CondensedMedium", size: 0.0625*width)
        backButton.frame = CGRect(x: width*0.25-width*0.25, y: height*0.9-height*0.025, width: width*0.5, height: height*0.05)
        
        continueNextButton.setTitle("continue >", for: .normal)
        continueNextButton.tintColor = UIColor.darkGray
        continueNextButton.addTarget(skip, action: #selector(ImpactDstraViewController.skip), for: UIControl.Event.touchUpInside)
        continueNextButton.titleLabel?.font = UIFont(name: "Futura-CondensedMedium", size: 0.0625*width)
        continueNextButton.frame = CGRect(x: width*0.75-width*0.25, y: height*0.9-height*0.025, width: width*0.5, height: height*0.05)
        
        view.addSubview(titleLabel)
        view.addSubview(skipButton)
        view.addSubview(continueButton)
    }
    
    @objc func skip(){
        performSegue(withIdentifier: "Sources", sender: self)
    }
    
    @objc func continueNext(){
        titleLabel.removeFromSuperview()
        skipButton.removeFromSuperview()
        continueButton.removeFromSuperview()
        textView.text = pageText[currPage]
        view.addSubview(textView)
        view.addSubview(nextButton)
    }
    
    @objc func nextPage(){
        if (backButton.isDescendant(of: view) == false){
            view.addSubview(backButton)
        }
        currPage += 1
        if(currPage == pageText.count - 1){
            nextButton.removeFromSuperview()
            view.addSubview(continueNextButton)
        }
        textView.text = pageText[currPage]
    }
    
    @objc func backPage(){
        if (nextButton.isDescendant(of: view) == false){
            view.addSubview(nextButton)
            continueNextButton.removeFromSuperview()
        }
        currPage -= 1
        if(currPage == 0){
            backButton.removeFromSuperview()
        }
        textView.text = pageText[currPage]
        
    }
}

