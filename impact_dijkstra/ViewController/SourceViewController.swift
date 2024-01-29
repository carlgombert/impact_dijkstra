//
//  SourceViewController.swift
//  impact_dijkstra
//
//  Created by Carl Gombert on 11/23/23.
//

import Foundation
import UIKit

class SourceViewController : UIViewController{
    
    var width = 0.0
    var height = 0.0
    var textUtil = TextUtil()
    var continueButton = UIButton()
    var skipButton = UIButton()
    var textView = UILabel()
    var pageText: [String] = []
    var currPage = 0
    var continueNextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        width = view.frame.size.width
        height = view.frame.size.height
        
        pageText = textUtil.sourceText
        
        skipButton.setTitle("restart", for: .normal)
        skipButton.tintColor = UIColor.darkGray
        skipButton.addTarget(skip, action: #selector(SourceViewController.skip), for: UIControl.Event.touchUpInside)
        skipButton.titleLabel?.font = UIFont(name: "Futura-CondensedMedium", size: 0.0625*width)
        skipButton.frame = CGRect(x: width*0.5-width*0.4, y: height*0.525-height*0.025, width: width*0.8, height: height*0.05)
        
        continueButton.setTitle("view sources", for: .normal)
        continueButton.tintColor = UIColor.darkGray
        continueButton.addTarget(continueNext, action: #selector(SourceViewController.continueNext), for: UIControl.Event.touchUpInside)
        continueButton.titleLabel?.font = UIFont(name: "Futura-CondensedMedium", size: 0.0625*width)
        continueButton.frame = CGRect(x: width*0.5-width*0.4, y: height*0.475-height*0.025, width: width*0.8, height: height*0.05)
        
        textView.font = UIFont(name: "Futura-CondensedMedium", size: 0.0345*width)
        textView.lineBreakMode = NSLineBreakMode.byWordWrapping
        textView.numberOfLines = 0
        textView.textAlignment = .center
        textView.textColor = UIColor.white
        textView.frame = CGRect(x: width*0.5-width*0.4, y: height*0.4-height*0.35, width: width*0.8, height: height*0.7)
        
        
        continueNextButton.setTitle("restart", for: .normal)
        continueNextButton.tintColor = UIColor.darkGray
        continueNextButton.addTarget(skip, action: #selector(SourceViewController.skip), for: UIControl.Event.touchUpInside)
        continueNextButton.titleLabel?.font = UIFont(name: "Futura-CondensedMedium", size: 0.0625*width)
        continueNextButton.frame = CGRect(x: width*0.5-width*0.25, y: height*0.9-height*0.025, width: width*0.5, height: height*0.05)
        
        view.addSubview(skipButton)
        view.addSubview(continueButton)
    }
    
    @objc func skip(){
        performSegue(withIdentifier: "Restart", sender: self)
    }
    
    @objc func continueNext(){
        skipButton.removeFromSuperview()
        continueButton.removeFromSuperview()
        textView.text = pageText[currPage]
        view.addSubview(textView)
        view.addSubview(continueNextButton)
    }
    
}
