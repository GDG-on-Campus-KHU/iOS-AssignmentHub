//
//  Week6_Assignment.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 11/26/24.
//

import SwiftUI
import Combine

final class CounterManager: ObservableObject {
    @Published var count: Int = 0
}

struct Week6_Assignment: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Counter Manager")
                    .font(.title2)
                
                NavigationLink(destination: StateObjectExampleView()) {
                    Text("StateObject Example")
                        .font(.title3)
                        .foregroundStyle(.red)
                }
                
                NavigationLink(destination: ObservedObjectExampleView(counterManager: CounterManager())) {
                    Text("ObservedObject Example")
                        .font(.title3)
                        .foregroundStyle(.blue)
                }
            }
        }
    }
}

struct StateObjectExampleView: View {
    @StateObject private var counterManager = CounterManager()

    var body: some View {
        VStack(spacing: 20) {
            Text("StateObject Example")
                .font(.title)
            
            Text("Count: \(counterManager.count)")
                .font(.title2)
            
            HStack {
                Button("Increment") {
                    counterManager.count += 1
                }
                .buttonStyle(.borderedProminent)
                
                Button("Decrement") {
                    counterManager.count -= 1
                }
                .buttonStyle(.bordered)
            }
            
            Text("This view creates and owns the CounterManager instance.")
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct ObservedObjectExampleView: View {
    @ObservedObject var counterManager: CounterManager

    var body: some View {
        VStack(spacing: 20) {
            Text("ObservedObject Example")
                .font(.title)
            
            Text("Count: \(counterManager.count)")
                .font(.title2)
            
            HStack {
                Button("Increment") {
                    counterManager.count += 1
                }
                .buttonStyle(.borderedProminent)
                
                Button("Decrement") {
                    counterManager.count -= 1
                }
                .buttonStyle(.bordered)
            }
            
            Text("This view observes a CounterManager instance passed from the parent.")
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}
