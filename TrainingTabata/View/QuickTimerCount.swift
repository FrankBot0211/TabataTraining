//
//  QuickTimerCount.swift
//  TrainingTabata
//
//  Created by Huy Phan on 4/8/24.
//

import SwiftUI
import Observation

struct QuickTimerCount: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var minuteUI : String
    @State var secondUI : String

    @State var quickTimerStart : Bool
   

    @State private var timeRemaining = 100
    @State var pauseButtonPress = false
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        
        
        
        ZStack {
            Image("background_pink")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                
                Spacer()
                    .navigationBarBackButtonHidden(true)
                    .toolbar(content: {
                        ToolbarItem (placement: .navigationBarLeading)  {
                            
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                //  Image(systemName: "arrow.left")
                                Image(systemName: "lessthan")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30))
                                
                            })
                            
                            
                        }
                    })
                
                //Begin content
                ZStack {
                    Circle()
                        .stroke(Color(red: 221/255, green: 231/255, blue: 247/255, opacity: 0.2), lineWidth: 8)
                        .frame(width: 350, height: 350)
                        
                    HStack {

                        Label(minuteUI, systemImage: "")
                            .font(.system(size: 100))
                        .foregroundColor(Color(red: 221/255, green: 231/255, blue: 247/255, opacity: 1))
                        Label(":", systemImage: "")
                            .font(.system(size: 100))
                        .foregroundColor(Color(red: 221/255, green: 231/255, blue: 247/255, opacity: 1))
                        Label(secondUI, systemImage: "")
                            .font(.system(size: 100))
                            .foregroundColor(Color(red: 221/255, green: 231/255, blue: 247/255, opacity: 1))
                    }.onReceive(timer) { time in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                            var sec = Int(secondUI)
                            var min = Int(minuteUI)
                            if (sec! > 0){
                                sec! -= 1
                                //self.secondUI = numberToString(n:sec!)
                            } else
                            if (sec! == 0 ){
                                if (min! > 0){
                                    min! -= 1
                                    sec! = 59
                                }
                                
                            }
                            secondUI = numberToString(n:sec!)
                            minuteUI = numberToString(n:min!)
                        } else{
                            self.timer.upstream.connect().cancel()
                        }
                            
                    }
//                    .onChange(of: quickTimerStart, initial: true) {
//                        let sec = Int(secondUI)
//                        let min = Int(minuteUI)
//                    }
                    
                }.offset(y:-30)
                
                Rectangle()
                    .foregroundColor(Color(red: 221/255, green: 231/255, blue: 247/255, opacity: 0.2))
                    .frame(height: 2)
                    .frame(maxWidth: 200)
                    .padding(.bottom)
                    .offset(y:-30)
                
                Button() {
                    if(pauseButtonPress == false){
                        self.timer.upstream.connect().cancel()
                        self.pauseButtonPress = true
                    }else{
                        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        self.pauseButtonPress = false
                    }
                    
                } label:{
                    Image(systemName: "pause.circle").font(.system(size: 130))
                        .foregroundColor(Color(red: 221/255, green: 231/255, blue: 247/255, opacity: 0.6))
                }.offset(y:-30)
                
                
            }
        }
        .toolbarRole(.editor)
    }
}

#Preview {
    QuickTimerCount(minuteUI:"00", secondUI:"00",quickTimerStart:false)
    
}

