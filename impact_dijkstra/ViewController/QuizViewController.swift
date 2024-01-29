//
//  QuizViewController.swift
//  impact_dijkstra
//
//  Created by Carl Gombert on 12/9/23.
//

import Foundation
import UIKit

class QuizViewController : UIViewController{
    
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
    var questionButtons : [[QuizButton]] = [[],[]]
    var questionOptions : [[String]] = [["A -> B -> C", "A -> C", "I'm not sure"], ["A -> E -> G -> H -> I", "A -> C -> B -> G -> F -> D -> I", "A -> B -> G -> F -> D -> I", "I'm not sure"]]
    var graph1 = UIImageView()
    var graph1f = UIImageView()
    var graph2 = UIImageView()
    var graph2f = UIImageView()
    var graph3 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        width = view.frame.size.width
        height = view.frame.size.height
        
        pageText = textUtil.quizText
        
        titleLabel.text = "Introduction to Dijkstra's algorithm"
        titleLabel.font = UIFont(name: "Futura-CondensedMedium", size: 0.1145*width)
        titleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.frame = CGRect(x: width*0.5-width*0.4, y: height*0.35-height*0.075, width: width*0.8, height: height*0.20)
        
        skipButton.setTitle("skip", for: .normal)
        skipButton.tintColor = UIColor.darkGray
        skipButton.addTarget(skip2, action: #selector(QuizViewController.skip2), for: UIControl.Event.touchUpInside)
        skipButton.titleLabel?.font = UIFont(name: "Futura-CondensedMedium", size: 0.0625*width)
        skipButton.frame = CGRect(x: width*0.5-width*0.4, y: height*0.9-height*0.025, width: width*0.8, height: height*0.05)
        
        continueButton.setTitle("continue", for: .normal)
        continueButton.tintColor = UIColor.darkGray
        continueButton.addTarget(continueNext, action: #selector(QuizViewController.continueNext), for: UIControl.Event.touchUpInside)
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
        nextButton.addTarget(nextPage, action: #selector(QuizViewController.nextPage), for: UIControl.Event.touchUpInside)
        nextButton.titleLabel?.font = UIFont(name: "Futura-CondensedMedium", size: 0.0625*width)
        nextButton.frame = CGRect(x: width*0.75-width*0.25, y: height*0.9-height*0.025, width: width*0.5, height: height*0.05)
        
        backButton.setTitle("< back", for: .normal)
        backButton.tintColor = UIColor.darkGray
        backButton.addTarget(backPage, action: #selector(QuizViewController.backPage), for: UIControl.Event.touchUpInside)
        backButton.titleLabel?.font = UIFont(name: "Futura-CondensedMedium", size: 0.0625*width)
        backButton.frame = CGRect(x: width*0.25-width*0.25, y: height*0.9-height*0.025, width: width*0.5, height: height*0.05)
        
        continueNextButton.setTitle("next >", for: .normal)
        continueNextButton.tintColor = UIColor.darkGray
        continueNextButton.addTarget(skip, action: #selector(QuizViewController.skip), for: UIControl.Event.touchUpInside)
        continueNextButton.titleLabel?.font = UIFont(name: "Futura-CondensedMedium", size: 0.0625*width)
        continueNextButton.frame = CGRect(x: width*0.75-width*0.25, y: height*0.9-height*0.025, width: width*0.5, height: height*0.05)
        
        graph1.image = UIImage(named: "G1")
        graph1.frame = CGRect(x: width*0.5-width*0.4, y: height*0.1, width: width*0.8, height: width*0.7)
        
        graph1f.image = UIImage(named: "G1F")
        graph1f.frame = CGRect(x: width*0.5-width*0.4, y: height*0.1, width: width*0.8, height: width*0.7)
        
        graph2.image = UIImage(named: "G2")
        graph2.frame = CGRect(x: width*0.5-width*0.4, y: height*0.1, width: width*0.8, height: width*0.7)
        
        graph2f.image = UIImage(named: "G2F")
        graph2f.frame = CGRect(x: width*0.5-width*0.4, y: height*0.1, width: width*0.8, height: width*0.7)
        
        graph3.image = UIImage(named: "G3")
        graph3.frame = CGRect(x: width*0.5-width*0.4, y: height*0.1, width: width*0.8, height: width*0.7)
        
        for n in 0...(questionOptions.count - 1){
            for i in 0...(questionOptions[n].count - 1){
                let corr = (i == 1)
                let downShift = (height * 0.09 * Double(i+1-n))
                let button = QuizButton(correct: corr, questionID: n)
                button.addTarget(enterQ, action: #selector(QuizViewController.enterQ), for: UIControl.Event.touchUpInside)
                button.setTitle(questionOptions[n][i], for: .normal)
                button.titleLabel?.font = UIFont(name: "Futura-CondensedMedium", size: 0.0625*width)
                button.frame = CGRect(x: width*0.5-width*0.4, y: height*0.55 - height*0.04 + downShift, width: width*0.8, height: height*0.08)
                questionButtons[n].append(button)
            }
        }
        
        
        view.addSubview(titleLabel)
        view.addSubview(skipButton)
        view.addSubview(continueButton)
    }
    
    @objc func enterQ(sender: QuizButton){
        let q = sender.questionID
        sender.colorSwitch()
        textView.text = pageText[q].components(separatedBy: "@")[1]
        for qbutton in questionButtons[q]{
            qbutton.isEnabled = false
        }
        if sender.correct == false{
            textView.text = pageText[q].components(separatedBy: "@")[2]
            for qbutton in questionButtons[q]{
                if qbutton.correct{
                    qbutton.colorSwitch()
                }
            }
        }
        if(q == 0){
            graph1.removeFromSuperview()
            view.addSubview(graph1f)
        }
        else if(q == 1){
            graph2.removeFromSuperview()
            view.addSubview(graph2f)
        }
    }
    
    @objc func skip(){
        performSegue(withIdentifier: "IntroDstra", sender: self)
    }
    
    @objc func skip2(){
        performSegue(withIdentifier: "ImpactDstraAlt", sender: self)
    }
    
    @objc func continueNext(){
        textView.frame = CGRect(x: width*0.5-width*0.4, y: height*0.45 - height*0.04, width: width*0.8, height: height*0.15)
        titleLabel.removeFromSuperview()
        skipButton.removeFromSuperview()
        continueButton.removeFromSuperview()
        textView.text = pageText[currPage].components(separatedBy: "@")[0]
        view.addSubview(graph1)
        for button in questionButtons[0]{
            view.addSubview(button)
        }
        view.addSubview(nextButton)
        view.addSubview(textView)
    }
    
    @objc func nextPage(){
        if (backButton.isDescendant(of: view) == false){
            view.addSubview(backButton)
        }
        currPage += 1
        if(currPage == 1){
            graph1.removeFromSuperview()
            graph1f.removeFromSuperview()
            for button in questionButtons[0]{
                button.removeFromSuperview()
                button.revColorSwitch()
                button.isEnabled = true
            }
            for button in questionButtons[1]{
                view.addSubview(button)
            }
            textView.text = pageText[currPage].components(separatedBy: "@")[0]
            textView.frame = CGRect(x: width*0.5-width*0.4, y: height*0.43 - height*0.04, width: width*0.8, height: height*0.15)
            view.addSubview(graph2)
        }
        else if(currPage == 2){
            graph2.removeFromSuperview()
            graph2f.removeFromSuperview()
            for button in questionButtons[1]{
                button.removeFromSuperview()
                button.revColorSwitch()
                button.isEnabled = true
            }
            view.addSubview(graph3)
            textView.frame = CGRect(x: width*0.5-width*0.4, y: height*0.6-height*0.35, width: width*0.8, height: height*0.7)
            textView.text = pageText[currPage]
        }
        if(currPage == pageText.count - 1){
            nextButton.removeFromSuperview()
            view.addSubview(continueNextButton)
        }
    }
    
    @objc func backPage(){
        if (nextButton.isDescendant(of: view) == false){
            view.addSubview(nextButton)
            continueNextButton.removeFromSuperview()
        }
        if(currPage == 1){
            graph2.removeFromSuperview()
            graph2f.removeFromSuperview()
            for button in questionButtons[1]{
                button.removeFromSuperview()
                button.revColorSwitch()
                button.isEnabled = true
            }
            for button in questionButtons[0]{
                view.addSubview(button)
            }
            view.addSubview(graph1)
            textView.text = pageText[currPage-1].components(separatedBy: "@")[0]
            textView.frame = CGRect(x: width*0.5-width*0.4, y: height*0.45 - height*0.04, width: width*0.8, height: height*0.15)
        }
        else if(currPage == 2){
            for button in questionButtons[1]{
                view.addSubview(button)
            }
            view.addSubview(graph2)
            graph3.removeFromSuperview()
            textView.text = pageText[currPage-1].components(separatedBy: "@")[0]
            textView.frame = CGRect(x: width*0.5-width*0.4, y: height*0.43 - height*0.04, width: width*0.8, height: height*0.15)
        }
        currPage -= 1
        if(currPage == 0){
            backButton.removeFromSuperview()
        }
        
    }
}
