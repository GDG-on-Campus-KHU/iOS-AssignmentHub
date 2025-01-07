//
//  Week8_Assignment.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 1/7/25.
//

import SwiftUI

struct MyData: Decodable {
    let title: String
    let body: String
}

struct Week8_Assignment: View {
    @StateObject private var viewModel = Week8_AssignmentViewModel()
    @State var temp: Int = 1
    
    var body: some View {
        VStack {
            if let myData = viewModel.myData {
                VStack(spacing: 20) {
                    Text(myData.title)
                        .font(.largeTitle)
                    
                    Text(myData.body)
                        .font(.headline)
                }
            }
            
            if viewModel.isLoading {
                ProgressView()
            }
         
            Button {
                viewModel.fetch(id: String(temp))
                self.temp += 1
            } label: {
                Text("fetch data")
            }
            .padding(.top, 20)
            
            Button {
                viewModel.clearData()
            } label: {
                Text("clear")
            }
            .padding(.top, 20)
        }
    }
}

class Week8_AssignmentViewModel: ObservableObject {
    @Published var myData: MyData?
    @Published var isLoading: Bool = false
    
    let url: String = "https://jsonplaceholder.typicode.com/posts/"
    
    func fetch(id: String) {
        isLoading = true
        clearData()
        guard let myURL = URL(string: url + id) else { return }
        
        URLSession.shared.dataTask(with: myURL) { data, _, error in
            if let data {
                do {
                    let myData = try JSONDecoder().decode(MyData.self, from: data)
                    DispatchQueue.main.async {
                        self.myData = myData
                        self.isLoading = false
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .resume()
    }
    
    func clearData() {
        self.myData = nil
    }
}
