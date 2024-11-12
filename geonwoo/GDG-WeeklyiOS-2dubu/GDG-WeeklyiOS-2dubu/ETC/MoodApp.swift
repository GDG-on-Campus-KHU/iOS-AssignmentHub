//
//  MoodApp.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 11/6/24.
//

import SwiftUI

struct Mood: Identifiable {
    let id = UUID()
    let emoji: String
    let description: String
    let date: Date
}

struct MoodApp: View {
    @State private var moods: [Mood] = []
    
    private let availableMoods = [
        "😊": "행복함",
        "😔": "피곤함",
        "😡": "화남",
        "🥳": "신남",
        "😴": "졸림"
    ]

    var body: some View {
        VStack {
            Text("How are you feeling today?")
                .font(.title)
                .padding()

            HStack(spacing: 20) {
                ForEach(availableMoods.keys.sorted(), id: \.self) { moodEmoji in
                    Button(action: {
                        logMood(emoji: moodEmoji)
                    }) {
                        VStack {
                            Text(moodEmoji)
                                .font(.largeTitle)
                        }
                    }
                }
            }
            .padding()

            Text("Mood History")
                .font(.headline)
                .padding(.top)

            List {
                ForEach(moods) { mood in
                    HStack(spacing: 15) {
                        Text(mood.emoji)
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text(mood.description)
                                .font(.subheadline)
                            Text(formattedDate(mood.date))
                                .font(.caption)
                        }
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            removeMood(mood: mood)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
        }
        .padding()
        .preferredColorScheme(.dark)
    }

    private func logMood(emoji: String) {
        let description = availableMoods[emoji] ?? "기분 알 수 없음"
        let newMood = Mood(emoji: emoji, description: description, date: Date())
        withAnimation { moods.insert(newMood, at: 0) }
    }

    private func removeMood(mood: Mood) {
        guard let index = moods.firstIndex(where: { $0.id == mood.id }) else { return }
        withAnimation { moods.remove(at: index) }
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = .init(identifier: "ko_KR")
        formatter.dateFormat = "a h시 m분 s초"
        return formatter.string(from: date)
    }
}
