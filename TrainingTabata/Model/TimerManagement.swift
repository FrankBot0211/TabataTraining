//
//  TimerManagement.swift
//  TrainingTabata
//
//  Created by Huy Phan on 4/7/24.
//

import Foundation
import Observation

struct TimerManagement{
    let minuteArrayValue = ["00","01","02","03","04","05","06","07","08","09","10",
                            "11","12","13","14","15","16","17","18","19","20",
                            "21","22","23","24","25","26","27","28","29","30",
                            "31","32","33","34","35","36","37","38","39","40",
                            "41","42","43","44","45","46","47","48","49","50",
                            "51","52","53","54","55","56","57","58","59"
    ]
    let secondArrayValue = ["00","01","02","03","04","05","06","07","08","09","10",
                            "11","12","13","14","15","16","17","18","19","20",
                            "21","22","23","24","25","26","27","28","29","30",
                            "31","32","33","34","35","36","37","38","39","40",
                            "41","42","43","44","45","46","47","48","49","50",
                            "51","52","53","54","55","56","57","58","59"
    ]
}
//struct tabataTimerModel {
//    var warmUpName = "WarmUp"
//    var warmUPTime = 20
//    var repName = "Rep"
//    var repTime = 60
//    var restBetWeenRepName = "Rest Betwen Rep"
//    var setName = "Set"
//    var setValue = 5
//    var restBetWeenSetName = "Rest Betwen Set"
//    var restBetWeenSeValue = 0
//    var cycleName = "Cycle"
//    var cycleValue = 5
//    var coolDownName = "Cool Down"
//    var coolDownvalue = 180
//    var endName = "End Section"
//    
//}

struct tabataTimerModel:Identifiable {
    var id = UUID()
    var titleLabel : String
    var timeValue: Int
}

class TimeManager:ObservableObject {
    
    @Published var timerData = [
        tabataTimerModel(titleLabel: "Warm Up", timeValue: 20), //0
        tabataTimerModel(titleLabel: "Rep", timeValue: 60),//1
        tabataTimerModel(titleLabel: "Rest Between Rep", timeValue: 60),//2
        tabataTimerModel(titleLabel: "Cycle", timeValue: 5),//3
        tabataTimerModel(titleLabel: "Set", timeValue: 5),//4
        tabataTimerModel(titleLabel: "Rest Between Set", timeValue: 60),//5
        tabataTimerModel(titleLabel: "Cool Down", timeValue: 60),//6
        tabataTimerModel(titleLabel: "End", timeValue: 0)//7
    ]
//    func increaseTime(timeModel : tabataTimerModel){
//        self.timerData
//    }
//    mutating func decreaseTime(timeModel : tabataTimerModel){
//        timeModel.timeValue += 1
//    }
    
    func totalTime() -> String {
        var secondValue = 0
        var minuteValue = 0
        var hourValue = 0
        var totalTime = 0
        totalTime = timerData[0].timeValue + ((timerData[1].timeValue+timerData[2].timeValue) * timerData[3].timeValue)*timerData[4].timeValue + timerData[5].timeValue + timerData[6].timeValue
        hourValue = totalTime/3600
        
        var temVal = totalTime - hourValue*3600
        if ((totalTime - hourValue*3600)/60<0){
            minuteValue = 0
        }
        else {
            minuteValue = (totalTime - hourValue*3600)/60
        }
        
        secondValue = temVal - minuteValue*60
        
        return "\(hourValue):\(minuteValue):\(secondValue)"
    }
    
    func countDown (timeModel: tabataTimerModel){
//        var sec = Int(secondUI)
//        if (sec! > 0){
//            sec! -= 1
            //self.secondUI = numberToString(n:sec!)
        }
    }

