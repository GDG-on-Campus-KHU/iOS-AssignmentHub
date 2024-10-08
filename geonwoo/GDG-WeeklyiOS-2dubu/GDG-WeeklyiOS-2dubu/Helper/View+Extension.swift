//
//  View+Extension.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 10/8/24.
//

import SwiftUI

extension View {
    func darken(color: Color, amount: Double) -> Color {
        let components = UIColor(color).cgColor.components ?? [0, 0, 0, 1]
        
        let red = min(1.0, max(0.0, components[0] - amount))
        let green = min(1.0, max(0.0, components[1] - amount))
        let blue = min(1.0, max(0.0, components[2] - amount))
        
        return Color(red: red, green: green, blue: blue)
    }
}
