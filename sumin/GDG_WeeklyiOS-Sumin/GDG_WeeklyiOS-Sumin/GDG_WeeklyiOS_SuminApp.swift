//
//  GDG_WeeklyiOS_SuminApp.swift
//  GDG_WeeklyiOS-Sumin
//
//  Created by SSUM on 10/8/24.
//
import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.pink)
                    .frame(height: 250)
                Rectangle()
                    .fill(Color.orange)
                    .frame(height: 90)

                Rectangle()
                    .fill(Color.white)
                    .frame(height: 50)
                    .overlay(
                        HStack {
                            Text("My")
                                .font(.title2)
                                .foregroundColor(.gray)
                            Text("W:SH")
                                .font(.title3)
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal)
                    )
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 10)
        }
        .frame(width: 300, height: 350)
    }
}


@main
struct MyCardApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
