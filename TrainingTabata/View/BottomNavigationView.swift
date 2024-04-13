//
//  BottomNavigationView.swift
//  TrainingTabata
//
//  Created by Huy Phan on 4/10/24.
//

import SwiftUI

struct BottomNavigationView: View {
    var body: some View {
       
        ZStack {
            Rectangle()
                            .foregroundColor(.red)
                            .frame(height: 90)
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 68/255, green: 77/255, blue: 84/255, opacity: 1))
            TabView{
                FirstPageView()
                    .tabItem(){
                        Image(systemName: "house.fill").font(.system(size: 35))
                            .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
                        Text("Home").foregroundColor(.white)
                    }
                SetUpView()
                    .tabItem(){
                        Image(systemName: "bookmark.fill").font(.system(size: 35))
                            .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
                        Text("Training Plan").foregroundColor(.white)
                    }
                LogView()
                    .tabItem(){
                        Image(systemName: "chart.bar.fill").font(.system(size: 35))
                            .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
                        Text("Log").foregroundColor(.white)
                    }
                YouView()
                    .tabItem(){
                        Image(systemName: "person.fill").font(.system(size: 35))
                            .foregroundColor(Color(red: 221, green: 231, blue: 247, opacity: 0.5))
                        Text("You").foregroundColor(.white)
                    }
            }
        }
    }
}

#Preview {
    BottomNavigationView()
}
