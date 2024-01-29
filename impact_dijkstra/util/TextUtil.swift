//
//  Text.swift
//  impact_dijkstra
//
//  Created by Carl Gombert on 11/21/23.
//

import Foundation

class TextUtil{
    
    var introGraphText: [String] = []
    var introGraphTextFiles: [String] = ["IGT1", "IGT2", "IGT3", "IGT4"]
    
    var quizText: [String] = []
    var quizTextFiles: [String] = ["QT1", "QT2", "QT3"]
    
    var introDtraText: [String] = []
    var introDtraTextFiles: [String] = ["IDT1", "IDT2", "IDT3", "IDT4"]
    
    var impactDtraText: [String] = []
    var impactDtraTextFiles: [String] = ["IMDT1", "IMDT2", "IMDT3", "IMDT4", "IMDT5", "IMDT6", "IMDT7", "IMDT8"]
    
    var sourceText: [String] = []
    var sourceTextFiles: [String] = ["ST1"]
    
    init(){
        do{
            for path in introGraphTextFiles{
                let temp = Bundle.main.path(forResource: path, ofType: "txt")
                introGraphText.append(try String(contentsOfFile: temp!, encoding: String.Encoding.utf8))
            }
            for path in quizTextFiles{
                let temp = Bundle.main.path(forResource: path, ofType: "txt")
                quizText.append(try String(contentsOfFile: temp!, encoding: String.Encoding.utf8))
            }
            for path in introDtraTextFiles{
                let temp = Bundle.main.path(forResource: path, ofType: "txt")
                introDtraText.append(try String(contentsOfFile: temp!, encoding: String.Encoding.utf8))
            }
            for path in impactDtraTextFiles{
                let temp = Bundle.main.path(forResource: path, ofType: "txt")
                impactDtraText.append(try String(contentsOfFile: temp!, encoding: String.Encoding.utf8))
            }
            for path in sourceTextFiles{
                let temp = Bundle.main.path(forResource: path, ofType: "txt")
                sourceText.append(try String(contentsOfFile: temp!, encoding: String.Encoding.utf8))
            }
        }
        catch{}
    }
   
}
