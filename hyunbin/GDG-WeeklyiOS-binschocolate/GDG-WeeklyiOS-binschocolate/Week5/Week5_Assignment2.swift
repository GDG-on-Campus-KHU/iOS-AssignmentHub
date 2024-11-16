//
//  Week5_Assignment.swift
//  GDG-WeeklyiOS-binschocolate
//
//  Created by 박현빈 on 11/13/24.
//

import SwiftUI
import Combine

struct Week5_Assignment2: View {
    
    @State private var currenttime : String = ""
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            Text("😎CountDown Timer😎")
                .font(.system(size:30, weight: .bold))
                .padding(.bottom, 20)
            HStack{
                Text(currenttime)
                Text("seconds")
            }
            
            .onReceive(timer){ _ in
                
            }
            
            
        }
    }
}

#Preview {
    Week5_Assignment2()
}
