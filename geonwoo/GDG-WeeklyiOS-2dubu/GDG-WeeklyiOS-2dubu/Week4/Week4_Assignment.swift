//
//  Week4_Assignment.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 11/4/24.
//

import SwiftUI

struct Week4_Assignment: View {
    @State private var colors: [Color] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]
    @State private var columns: [GridItem] = .init()
    @State private var temp = -1
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(0..<colors.count, id: \.self) { index in
                            colors[index]
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                    .padding()
                }
                
                Button(action: changeGrid) {
                    Text("Change Grid Layout")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .navigationTitle("Grid Layout 😎")
            .onAppear {
                changeGrid()
            }
        }
    }
    
    private func changeGrid() {
        withAnimation {
            let nextColumnCount = (columns.count % 4) + 1
            columns = Array(repeating: .init(.flexible()), count: nextColumnCount)
        }
    }
}

#Preview {
    Week4_Assignment()
}

