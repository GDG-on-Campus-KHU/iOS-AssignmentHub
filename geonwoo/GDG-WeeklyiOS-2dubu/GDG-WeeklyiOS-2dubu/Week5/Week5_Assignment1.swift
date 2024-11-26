//
//  Week5_Assignment1.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 11/12/24.
//

import SwiftUI

struct Week5_Assignment1: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(1...10, id: \.self) { number in
                    Text("Scrollable Item \(number)")
                        .frame(width: UIScreen.main.bounds.width - 40, height: 150)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Scrollable Content")
        }
    }
}

#Preview {
    Week5_Assignment1()
}
