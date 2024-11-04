//
//  GDG_WeeklyiOS_2dubuApp.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 10/8/24.
//

import SwiftUI

@main
struct GDG_WeeklyiOS_2dubuApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                VStack(spacing: 20) {
                    NavigationLink {
                        Week3_Practice()
                    } label: {
                        Text("Week3_Practice")
                    }
                    
                    NavigationLink {
                        Week3_Assignment()
                    } label: {
                        Text("Week3_Assignment")
                    }
                    
                    NavigationLink {
                        Week4_Assignment()
                    } label: {
                        Text("Week4_Assignment")
                    }
                }
            }
        }
    }
}
