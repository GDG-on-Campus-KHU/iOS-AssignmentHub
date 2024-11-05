//
//  Week3_Assignment.swift
//  GDG-WeeklyiOS-Gardeniaa101
//
//  Created by HanJW on 10/8/24.
//

import SwiftUI

//TODO: - 경희대 학생증 카드 앞면 만들기
struct Week3_Assignment: View {
    var body: some View {
        ZStack{
            Color("primary_red")
                .frame(width: 359, height: 570)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x:5, y: 10)
            
            VStack() {
                Image("upper_arrow")
                    .offset(x: 0, y: -45)
                
                Rectangle()
                    .fill(Color("ICchip_yellow"))
                    .frame(width: 55, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: Color.black.opacity(0.5), radius: 3)
                    .offset(x: 0, y: -45)
                
                Image("logo_drapes")
                    .resizable()
                    .frame(width: 270, height: 170)
                
                Text("KHUNGEE UNIVERSITY")
                    .foregroundStyle(Color("font_yellow"))
                    .font(.title2)
                    .bold()
                    .padding(.top, 20)
                
                Image("logo_mastercard")
                    .resizable()
                    .frame(width: 120, height: 80)
                    .offset(x: 100, y: 40)
            }
        }
    }
}

#Preview {
    Week3_Assignment()
}
