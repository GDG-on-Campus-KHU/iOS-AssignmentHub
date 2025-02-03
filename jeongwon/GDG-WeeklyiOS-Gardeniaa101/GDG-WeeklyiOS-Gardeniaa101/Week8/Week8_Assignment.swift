//
//  Week8_Assignment.swift
//  GDG-WeeklyiOS-Gardeniaa101
//
//  Created by HanJW on 1/22/25.
//

import SwiftUI
import Combine

struct MyData: Decodable {
    let title: String
    let body: String
}

struct Week8_Assignment: View {
    @StateObject private var viewModel = Week8_AssignmentViewModel()
    @State var tempID: Int = 1
    
    var body: some View {
        VStack {
            if let myData = viewModel.myData {
                VStack {
                    Text(myData.title)
                        .font(.largeTitle)
                    
                    Text(myData.body)
                        .font(.footnote)
                }
            }
            
            if viewModel.isLoading {
                ProgressView()
            }
            
            Button("Fetch Data") {
                viewModel.fetchData(for: String(tempID))
                tempID += 1
            }
            .padding(.top, 20)
            
            Button("Clear") {
                viewModel.clearData()
            }
            .padding(.top, 20)
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
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                defer { self.isLoading = false }
                
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
                    self.myData = decodedData
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
