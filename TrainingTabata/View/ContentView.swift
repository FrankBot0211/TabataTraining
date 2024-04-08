//
//  ContentView.swift
//  TrainingTabata
//
//  Created by Huy Phan on 3/27/24.
//

import SwiftUI

struct ContentView: View {
    @State var quickMode = true
    @State var minuteValue = 3
    @State var secondValue = 3
    @State var minuteUI = "03"
    @State var secondUI = "03"
    var body: some View {
        
        
        ZStack {
            Image("background_pink")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(alignment: .center) {
                Spacer()
                Label("Quick Timer", systemImage: "")
                    .font(.system(size: 25))
                    .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.8))
                Toggle(isOn: $quickMode) {
                    Text("Mode")
                }
                .tint(Color(red: 1.0, green: 0, blue: 1.0, opacity: 0))
                .scaleEffect(1.8)
                .labelsHidden()
                HStack {
                    Label(minuteUI, systemImage: "")
                        .font(.system(size: 120))
                        .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
                    Label(secondUI, systemImage: "")
                        .font(.system(size: 120))
                        .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
                }
                Button() {
                    print("Start")
                    var sec = Int(secondUI)
                    var min = Int(minuteUI)
                    var timerDuration = min!*60 + sec!
                    for i in 1...timerDuration{
                        Timer.scheduledTimer(withTimeInterval: Double(0) + Double(i), repeats: false) { timer in
                            if (sec! > 0){
                                sec! -= 1
                                //self.secondUI = numberToString(n:sec!)
                            } else
                            if (sec == 0 ){
                                if (min! > 0){
                                    min! -= 1
                                    sec = 59
                                }
                                    
                            }
                            print(i)
                            self.secondUI = numberToString(n:sec!)
                            self.minuteUI = numberToString(n:min!)
                            
                        }
                    
                    }
                    
                } label:{
                    Image(systemName: "play.circle").font(.system(size: 130))
                        .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
                }
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 90)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 68/255, green: 77/255, blue: 84/255, opacity: 0.2))
                    HStack(){
                        Spacer()
                        Button() {
                            print("Home")
                        } label:{
                            
                            VStack {
                                Image(systemName: "house.fill").font(.system(size: 35))
                                    .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
                                Text("Home").foregroundColor(.white)
                                
                            }
                        }
                        Spacer()
                        Button() {
                            print("Plan")
                        } label:{
                            VStack {
                                Image(systemName: "bookmark.fill").font(.system(size: 35))
                                    .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
                                Text("Training Plan").foregroundColor(.white)
                            }
                            
                        }
                        Spacer()
                        Button() {
                            print("Personal Record")
                        } label:{
                            VStack {
                                Image(systemName: "chart.bar.fill").font(.system(size: 35))
                                    .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
                                Text("Log").foregroundColor(.white)
                            }
                            
                            
                        }
                        Spacer()
                        Button() {
                            print("User")
                        } label:{
                            VStack {
                                Image(systemName: "person.fill").font(.system(size: 35))
                                    .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
                                Text("You").foregroundColor(.white)
                                
                            }
                        }
                        Spacer()
                    }
                }
            }.edgesIgnoringSafeArea(.all)
            
        }
    }
}

#Preview {
    ContentView()
}

func numberToString (n:Int) -> String {
    if n < 10{
        return "0\(n)"
    } else {
        return "\(n)"
    }
    
}
