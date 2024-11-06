//
//  RandomColorApp.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 11/6/24.
//

import SwiftUI

struct RandomColorApp: View {
    @State private var colors: [Color] = [
        .red, .blue, .green, .orange, .purple, .yellow
    ]
    
    @State private var rotations: [Double] = Array(repeating: 0, count: 6)
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ForEach(colors.indices, id: \.self) { index in
                    Rectangle()
                        .fill(colors[index])
                        .frame(width: geometry.size.width, height: geometry.size.height / 6)
                        .rotation3DEffect(
                            .degrees(rotations[index]),
                            axis: (x: 1, y: 0, z: 0),
                            perspective: 1
                        )
                        .animation(.easeInOut(duration: 0.6), value: rotations[index])
                }
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            randomizeColorsWithRotation()
        }
    }
    
    private func randomizeColorsWithRotation() {
        withAnimation(.easeInOut(duration: 0.6)) {
            for i in rotations.indices {
                rotations[i] += 180
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            colors = colors.shuffled()
        }
    }
}
