//
//  week5_practice.swift
//  GDG-WeeklyiOS-binschocolate
//
//  Created by 박현빈 on 11/14/24.
//

import SwiftUI

struct  week5_practice: View {
    let date = Date()
    @State var timeRemaining : Int = 100
    
    var body: some View {
        ZStack {
            Text(timeRemaining.description)
                .font(.system(size: 50))
        }
    }
}

#Preview {
    week5_practice()
}
//radio쓱
