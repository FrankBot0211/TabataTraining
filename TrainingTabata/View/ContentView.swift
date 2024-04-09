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
    @State var minuteUI = "00"
    @State var secondUI = "00"
    var quickTimerStart = false
    var timerManager = TimerManagement()
    
    var body: some View {
        
        NavigationView{
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
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 10)
                        .frame(maxWidth: 140)
                    
                    HStack {
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(height: 180)
                                .frame(maxWidth: 140)
                                .padding()
                            Picker(selection: $minuteUI, label: Text("Picker")) {
                                    ForEach(timerManager.minuteArrayValue, id:\.self ) { minute in
                                        Text(minute)
                                            .font(.largeTitle)
                                            .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.8))
                                            .font(.system(size: 30))
                                            
                                    }
                                }
                            .scaleEffect(3)
                                .frame(maxWidth: 70, maxHeight: 80)
                            .pickerStyle(.wheel)
                        }
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(height: 180)
                                .frame(maxWidth: 140)
                            Picker(selection: $secondUI, label: Text("Picker")) {
                                ForEach(timerManager.secondArrayValue, id:\.self ) { second in
                                    Text(second)
                                        .font(.largeTitle)
                                        .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.8))
                                        .font(.system(size: 40))
                                    
                                        
                                }
                            }
                            .scaleEffect(3)
                            .frame(maxWidth: 70, maxHeight: 80)
                        .pickerStyle(.wheel)
                        }

                    }
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 2)
                        .frame(maxWidth: 140)
                    
                    NavigationLink(destination: QuickTimerCount(minuteUI: minuteUI, secondUI: secondUI, quickTimerStart: true)) {
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
        .accentColor(Color(.label))
        
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
