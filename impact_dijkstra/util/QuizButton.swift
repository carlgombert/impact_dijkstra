//
//  QuizButton.swift
//  impact_dijkstra
//
//  Created by Carl Gombert on 12/9/23.
//

import UIKit
import Foundation

class QuizButton: UIButton {

    var correct: Bool
    var questionID: Int

    required init(correct: Bool, questionID: Int) {
        // set myValue before super.init is called
        self.correct = correct
        self.questionID = questionID
        
        super.init(frame: .zero)
        
        // set other operations after super.init, if required
        backgroundColor = UIColor(named: "Button")
        
    }
    
    func colorSwitch(){
        if(correct){
            backgroundColor = UIColor(named: "ButtonCorrect")
        }
        else{
            backgroundColor = UIColor(named: "ButtonIncorrect")
        }
    }
    
    func revColorSwitch(){
        backgroundColor = UIColor(named: "Button")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
