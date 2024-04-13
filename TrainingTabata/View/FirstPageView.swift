//
//  ContentView.swift
//  TrainingTabata
//
//  Created by Huy Phan on 3/27/24.
//

import SwiftUI

struct FirstPageView: View {
    
    @State var quickMode = true
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
                    HeaderBar()
                    Spacer()
                    PickerModel(minuteUI: $minuteUI, secondUI: $secondUI)
                    
                    MarginComponent(heightValue: 2, widthValue: 140)
                    
                    NavigationLink(destination: QuickTimerCount(minuteUI: minuteUI, secondUI: secondUI, quickTimerStart: true)) {
                        Image(systemName: "play.circle").font(.system(size: 130))
                            .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
                    }
                    Spacer()
                    
                    FooterView()
                    
                }
                .edgesIgnoringSafeArea(.all)
                
            }
        }
        //.accentColor(Color(.label))
//        .tint(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
        
        }
    
        
}

#Preview {
    FirstPageView()
    
}

func numberToString (n:Int) -> String {
    if n < 10{
        return "0\(n)"
    } else {
        return "\(n)"
    }
    
}

struct HeaderBar: View {
    var body: some View {
        VStack {
            HStack{
                
                Label("Quick Timer", systemImage: "")
                    .font(.system(size: 40))
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.8))
                    .padding(.horizontal)
                Spacer()
                VStack {

                    NavigationLink(destination: SetUpView()) {
                        Image(systemName: "greaterthan.square.fill")
                            .font(.system(size: 50))
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
                            .padding(.horizontal)
                            .offset(y:-3)
                        
                    }
                }
            }
            
        }
    }
}



