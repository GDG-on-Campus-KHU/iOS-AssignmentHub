//
//  Week6_Practice.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 11/26/24.
//

import SwiftUI

final class NavigationManager: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
    func popToRoot() {
        path = .init()
    }
}

enum AppScreen: Hashable {
    case home
    case details
    case final
}

// root view
struct Week6_Practice: View {
    @StateObject private var navState = NavigationManager()
    
    var body: some View {
        NavigationStack(path: $navState.path) {
            Week6_HomeView()
                .navigationDestination(for: AppScreen.self) { screen in
                    switch screen {
                    case .home:
                        Week6_HomeView()
                    case .details:
                        Week6_DetailsView()
                    case .final:
                        Week6_FinalView()
                    }
                }
        }
        .environmentObject(navState)
    }
}

struct Week6_HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to Home View")
                .font(.title)
            
            NavigationLink("Go to Details", value: AppScreen.details)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Week6_DetailsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("You're on the Details View")
                .font(.title)
            
            NavigationLink("Go to Final View", value: AppScreen.final)
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Week6_FinalView: View {
    @EnvironmentObject var appState: NavigationManager
    
    var body: some View {
        VStack(spacing: 20) {
            Text("You're on the Final View")
                .font(.title)
            
            Button {
                appState.popToRoot()
            } label: {
                Text("Go to Home")
                    .foregroundStyle(.red)
            }
        }
        .navigationTitle("Final")
        .navigationBarTitleDisplayMode(.inline)
    }
}
