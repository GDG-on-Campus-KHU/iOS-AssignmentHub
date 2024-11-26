//
//  Week6_Practice.swift
//  GDG-WeeklyiOS-binschocolate
//
//  Created by 박현빈 on 11/26/24.
//

import SwiftUI


/*struct HomeView: View {
    var body: some View {
        NavigationView{
            NavigationLink(destination: DetailView()){
                Text("Go to DetailView")
            }
        }
       
    }
}

struct DetailView: View{
    var body: some View {
        NavigationView{
            NavigationLink(destination: FinalView()){
                Text("Go to FinalView")
            }
        }
    }
}


struct FinalView: View{
    var body: some View {
        NavigationView{
            NavigationLink(destination: HomeView()){
                Text("Go to HomeView")
            }
        }
    }
}*/

final class NavigationManager: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    //var currentScreen: AppScreen = .home
    
    func popToRoot(){
        path = .init()
    }
}


enum AppScreen: Hashable {
    case home
    case detail
    case final
}


struct Week6_Practice: View {
    @StateObject private var navState = NavigationManager()
    
    var body: some View {
        NavigationStack(path: $navState.path){
            HomeView()
                .navigationDestination(for: AppScreen.self) {screen in
                    switch screen {
                    case .home :
                        HomeView()
                    case .detail:
                        DetailView()
                    case .final:
                        FinalView()
                    }
                }
                
        }
        .environmentObject(navState)
    
    }
}

struct HomeView: View {
    var body: some View {
        Text("homeview")
        NavigationLink("goto detail", value: AppScreen.detail)
            .navigationTitle("home")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView: View {
    var body: some View {
        Text("detailview")
        NavigationLink("goto final", value: AppScreen.final)
            .navigationTitle("detail")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct FinalView: View {
    
    @EnvironmentObject var appState: NavigationManager
    
    var body: some View {
        Text("final view")
        Button{
            appState.popToRoot()
        } label: {
            Text("goto home")
                .foregroundStyle(.red)
        }
        
    }
}


#Preview {
    Week6_Practice()
}
