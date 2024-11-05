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
                List {
                    Section("Week 3") {
                        AssignmentLink(destination: Week3_Practice(), label: "Week3 Practice")
                        AssignmentLink(destination: Week3_Assignment(), label: "Week3 Assignment")
                    }
                    
                    Section("Week 4") {
                        AssignmentLink(destination: Week4_Assignment(), label: "Week4 Assignment")
                    }
                }
                .navigationTitle("GDG WeeklyiOS 😼")
            }
        }
    }
}

private struct AssignmentLink<Destination: View>: View {
    let destination: Destination
    let label: String
    
    var body: some View {
        NavigationLink(destination: destination.navigationBarTitleDisplayMode(.inline)) {
            Text(label)
        }
    }
}
