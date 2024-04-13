//
//  SubViewComponent.swift
//  TrainingTabata
//
//  Created by Huy Phan on 4/10/24.
//

import SwiftUI

//struct SubViewComponent: View {
//    var body: some View {
//        Text("")
//    }
//}
//
//#Preview {
//    SubViewComponent()
//}

//Rectangle Margin
struct MarginComponent: View {
    
    var heightValue : CGFloat
    var widthValue : CGFloat
    
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(height: heightValue)
            .frame(maxWidth: widthValue)
    }
}

//Picker View
struct PickerModel: View {
    @Binding var minuteUI : String
    @Binding var secondUI : String
    var timerManager = TimerManagement()
    var body: some View {
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
    }
}


struct FooterView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(height: 90)
            .frame(maxWidth: .infinity)
            .background(Color(red: 68/255, green: 77/255, blue: 84/255, opacity: 0.2))
            
    }
}
