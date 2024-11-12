//
//  Week3.swift
//  GDG-WeeklyiOS-binschocolate
//
//  Created by 박현빈 on 10/8/24.
//

import SwiftUI

struct Week3: View {
    var body: some View {
        VStack(spacing: 0) {
            Color.red.frame(height: 400)
            Color.orange.frame(height: 120)
            Color.white.frame(height: 40)
        }
        
        Rectangle()
            .fill(Color.red)
            .frame(width: 160, height: 160)
        Circle()
            .fill(Color.pink)
            .frame(width: 160, height: 160)
            .offset(y: -30)
            // .overlay(alignment: .topLeading, content:)
    }
}








#Preview {
    Week3()
}

