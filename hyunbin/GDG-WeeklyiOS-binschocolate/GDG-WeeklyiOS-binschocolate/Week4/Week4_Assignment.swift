//
//  Week4_Assignment.swift
//  GDG-WeeklyiOS-binschocolate
//
//  Created by 박현빈 on 11/13/24.
//
import UIKit
import SwiftUI

struct Week4_Assignment: View {
    
    @State private var columns = [GridItem(.flexible())]
    let colors: [Color] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    LazyVGrid(columns: columns){
                        ForEach(0..<colors.count, id: \.self){
                            index in colors[index]
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                    .padding(10)
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
            
            
           
        }
    }
    private func changeGrid() {
        withAnimation {
            let nextColumnCount = (columns.count % 4) + 1
            columns = Array(repeating: .init(.flexible()), count: nextColumnCount)
        }
    }
}



#Preview{
  Week4_Assignment()
}
