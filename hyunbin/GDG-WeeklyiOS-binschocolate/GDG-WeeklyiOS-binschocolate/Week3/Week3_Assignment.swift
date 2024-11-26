//
//  Week3_Assignment.swift
//  GDG-WeeklyiOS-binschocolate
//
//  Created by 박현빈 on 10/8/24.
//

import SwiftUI
import UIKit

// TODO : - 경희대 학생증 카드 만들어보기
struct Week3_Assignment: View {
    private let gold: Color = .init(uiColor: UIColor(red: 187/255, green: 165/255, blue: 67/255, alpha: 1))
    private let kyungheeRed: Color = Color(uiColor: UIColor(red: 130/255, green: 15/255, blue: 24/255, alpha: 1))
    
    var body: some View {
        ZStack(alignment: .bottom){
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(kyungheeRed)
                .frame(width: 330, height: 600)
                .overlay(alignment:.topTrailing){
                    Text("Hana Card")
                        .rotationEffect(Angle(degrees: 90))
                        .offset(x:10, y:55)
                        .foregroundColor(.gray)
                }
                .overlay(alignment:.top){
                    
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 60, height: 80)
                        .offset(y:40)
                    //.fill(Color.yellow)
                        .foregroundColor(gold)
                }
        
            VStack{
                Image("kyungheeimage")
                    .padding(10)
                    
                Text("KyungHee Umiversity")
                    .foregroundStyle(gold)
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .font(.title)
                    .padding(.bottom, 50)
                    
                HStack(spacing:-20){
                    Circle()
                        .foregroundStyle(.pink)
                    Circle()
                        .foregroundStyle(.yellow)
                }
                .frame(height: 60)
                .offset(x:100)
            }
            .padding(.bottom,30)
         
            
            
            
        }
    }
}

#Preview {
    Week3_Assignment()
}
