//
//  Week3_Practice.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 10/8/24.
//

import SwiftUI

struct Week3_Practice: View {
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    private let hotPink: Color = Color(uiColor: UIColor(red: 255/255, green: 55/255, blue: 193/155, alpha: 1))
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(.red)
                .frame(width: screenWidth - 100, height: screenWidth - 100)
                .overlay {
                    ZStack(alignment: .top) {
                        Circle()
                            .fill(hotPink)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.white)
                            .frame(width: 40, height: 50)
                            .offset(x: 15, y: 40)
                    }
                }
            
            Rectangle()
                .fill(.orange)
                .frame(width: screenWidth - 100, height: 80)
            
            Rectangle()
                .fill(.white)
                .frame(width: screenWidth - 100, height: 80)
                .overlay(alignment: .topLeading) {
                    VStack(alignment: .leading) {
                        Text("My")
                        Text("WE:SH")
                    }
                    .font(.system(size: 17, weight: .bold))
                    .padding(15)
                }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 20)
    }
}

#Preview {
    Week3_Practice()
}
