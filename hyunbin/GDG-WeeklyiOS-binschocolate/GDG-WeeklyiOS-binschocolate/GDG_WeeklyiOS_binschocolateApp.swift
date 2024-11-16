//
//  GDG_WeeklyiOS_binschocolateApp.swift
//  GDG-WeeklyiOS-binschocolate
//
//  Created by 박현빈 on 10/8/24.
//

import SwiftUI

@main
struct GDG_WeeklyiOS_binschocolateApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                List {
                    Section("Week 3") {
                        AssignmentLink(destination: Week3_Practice(), label: "Week3 Practice")
                        AssignmentLink(destination: Week3_Assignment(), label: "Week3 Assignment")
                    }
                    Section("Week 4") {
                        AssignmentLink(destination: Week4_Practice(), label: "Week4 Practice")
                        AssignmentLink(destination: Week4_Assignment(), label: "Week4 Assignment")
                    }
                    Section("Week 5") {
                        AssignmentLink(destination: Week5_Assignment1(), label: "Week5_Assignment1")
                        AssignmentLink(destination: Week5_Assignment2(), label: "Week5 Assignment2")
                    }
                    Section("SprintChallenge") {
                        AssignmentLink(destination: SprintChallenge_Timer(), label: "SprintChallenge_Timer")
                    }
                }
                .navigationTitle("박이의 앱 개발😼")
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
