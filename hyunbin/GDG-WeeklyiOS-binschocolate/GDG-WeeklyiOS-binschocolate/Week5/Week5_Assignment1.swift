//
//  Week5_Practice.swift
//  GDG-WeeklyiOS-binschocolate
//
//  Created by 박현빈 on 11/13/24.
//

import SwiftUI

struct Week5_Assignment1: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(1..<21){ index in
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.blue)
                                .padding(.horizontal, 20)
                            Text("Scroble item, \(index)")
                                .foregroundColor(.white)
                                .frame(height: 80)
                                .font(.system(size: 25))
                        }
                    }
                }
                .padding(.vertical, 20)
            }
            .navigationTitle("😎Scrollable Content😎")
        }
    }
}

#Preview {
    Week5_Assignment1()
}
