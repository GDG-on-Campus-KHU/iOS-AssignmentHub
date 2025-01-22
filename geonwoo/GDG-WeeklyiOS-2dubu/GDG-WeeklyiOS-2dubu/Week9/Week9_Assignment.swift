//
//  Week9_Assignment.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 1/22/25.
//

import SwiftUI
import Moya

struct Week9_Assignment: View {
    @StateObject private var viewModel = Week9_AssignmentViewModel()
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

final class Week9_AssignmentViewModel: ObservableObject {
    @Published var myData: MyData?
    @Published var isLoading: Bool = false
    
    private let provider = MoyaProvider<MyAPI>()
    
    func fetchData(for id: String) {
        isLoading = true
        clearData()

        provider.request(.jsonplaceholder(id: id)) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                defer { self.isLoading = false }
                
                switch result {
                case .success(let response):
                    do {
                        self.myData = try JSONDecoder().decode(MyData.self, from: response.data)
                    } catch {
                        print("Decoding Error: \(error.localizedDescription)")
                    }
                case .failure(let error):
                    print("Request Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func clearData() {
        myData = nil
    }
}
