//
//  SetUpView.swift
//  TrainingTabata
//
//  Created by Huy Phan on 4/9/24.
//

import SwiftUI
import Observation

struct SetUpView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var testc = ""
    @State var charIndex = 0.0
    
    var footerView = FooterView()
    
    @State var warmUpUI = "03"
    @State var tempWarmUp = 03
    @State var repSelected = true
    @StateObject var timerManager = TimeManager()
    //var tabataData :[tabataTimerModel] =
    
    var body: some View {
        
        ZStack {
            Image("background_pink")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
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
                
                //Navigator button
                //Start from here
                HStack{
                    Label("Tabata", systemImage: "")
                        .font(.system(size: 40))
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.8))
                        .padding(.horizontal)
                    Spacer()
                    Text("Total Time: \(timerManager.totalTime())")
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.8))
                        .padding(.horizontal)
                        .offset(y:10)
                }
                Spacer()
                HStack{
                    Label("Max Fingerboard", systemImage: "")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.8))
                        .padding(.horizontal)
                    Spacer()
                    
                    Image(systemName: "dumbbell.fill")
                        .font(.system(size: 30))
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.8))
                        .padding(.horizontal)
                        .offset(y:2)
                    
                    Toggle(isOn: $repSelected) {
                        Text("Label")
                    }
                    .labelsHidden()
                    .offset(x:-15)
                    
                }
                
                List($timerManager.timerData, id : \.id) { $item in
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height:120)
                        VStack {
                            Text("\(item.titleLabel)")
                                .font(.system(size: 30))
                                .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.8))
                            
                            HStack {
                                Button {
                                    if item.timeValue > 0 {
                                        item.timeValue -= 1
                                    }
                                    else {
                                        item.timeValue = 0
                                    }
                                    
                                }label: {
                                    //  Image(systemName: "arrow.left")
                                    Image(systemName: "lessthan")
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                }.buttonStyle(.borderless)
                                MarginComponent(heightValue: 0, widthValue: 70)
                                
                                Text("\(item.timeValue)")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.8))
                                MarginComponent(heightValue: 0, widthValue: 70)
                                Button {
                                    item.timeValue += 1
                                    
     
                                }label: {
                                    //  Image(systemName: "arrow.left")
                                    Image(systemName: "greaterthan")
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                }.buttonStyle(.borderless)
                                
                            }
                            Rectangle()
                                .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.8))
                                .frame(height:1)
                        }
                        
                    }.listRowBackground(Color(red: 0, green: 0, blue: 0, opacity: 0))
                }.scrollContentBackground(.hidden)
                
                
                //Start button
                Rectangle()
                    .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
                    .frame(height:1)
                HStack{
                    Spacer()
                    Button(action: {
                        print("Reset")
                    }, label: {
                        Image(systemName:"arrow.counterclockwise.circle.fill").font(.system(size: 80))
                            .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
                    })
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.8))
                            .frame(width: 250, height: 80,alignment: .top)
                            .cornerRadius(30)
                        
                        Text("Start")
                            .font(.system(size: 50))
                            .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.8))
                    }
                    Spacer()
                }
                
                
                // }
                Spacer()
                Spacer()
                footerView
                
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    SetUpView()
}

