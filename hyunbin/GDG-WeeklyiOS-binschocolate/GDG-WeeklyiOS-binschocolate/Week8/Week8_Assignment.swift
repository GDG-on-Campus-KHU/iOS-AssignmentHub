//
//  Week8_Assignment.swift
//  GDG-WeeklyiOS-binschocolate
//
//  Created by 박현빈 on 1/22/25.
//

//
//  Week8_Assignment.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 1/7/25.
//

import SwiftUI

struct MyData: Decodable { //디코딩 할려면 디코더블 무조건 줂수해야댐
    let title: String
    let body: String
}

struct Week8_Assignment: View {
    @StateObject private var viewModel = Week8_AssignmentViewModel()
    @State var tempID: Int = 1
    
    var body: some View {
        VStack {
            if let myData = viewModel.myData {
                VStack(spacing: 20) {
                    Text(myData.title)
                        .font(.largeTitle)
                    
                    Text(myData.body)
                        .font(.headline)
                }
                .transition(.opacity)
            }
            
            if viewModel.isLoading {
                ProgressView()
            }
            
            HStack(spacing: 20) {
                Button("Fetch Data") {
                    viewModel.fetchData(for: String(tempID))
                    tempID += 1
                }
                .buttonStyle(.bordered)
                
                Button("Clear Data") {
                    viewModel.clearData()
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

final class Week8_AssignmentViewModel: ObservableObject {
    @Published var myData: MyData?
    @Published var isLoading: Bool = false
    
    private let baseURL: String = "https://jsonplaceholder.typicode.com/posts/"
    
    func fetchData(for id: String) {
        guard let url = URL(string: baseURL + id) else {
            print("Invalid URL")
            return
        }
        
        DispatchQueue.main.async {
            self.isLoading = true
            self.clearData()
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            DispatchQueue.main.async {
                defer { self?.isLoading = false }
                
                if let error = error {
                    print("Fetch Error: \(error.localizedDescription)")
                    return
                }
                
                guard let data = data else {
                    print("No Data Received")
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(MyData.self, from: data)
                    withAnimation { self?.myData = decodedData }
                } catch {
                    print("Decoding Error: \(error.localizedDescription)")
                }
            }
        }
        .resume()
    }
    
    func clearData() {
        self.myData = nil
    }
}


#Preview {
    Week8_Assignment()
}
