//
//  ContentView.swift
//  gdgoncammm02
//
//  Created by SSUM on 11/5/24.
//

import SwiftUI

struct GithubProfileView: View {
    @State private var isFollowing = false
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack(alignment: .bottomTrailing) {
                Image("116950962")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                
                // 뱃지
                Image(systemName: "trophy.fill")
                    .resizable()
                    .foregroundColor(.yellow)
                    .padding(10)
                    .background(Color.white)
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                    .offset(x:0, y: 24)
            }
            
            Text("Im Sumin (임수민)")
                .font(.title)
                .bold()
            Text("ssum21")
            
            // 팔로우 버튼
            Button(action: {
                isFollowing.toggle()
            }) {
                Text(isFollowing ? "Unfollow" : "Follow")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isFollowing ? Color.red : Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            
            Text("KHU CS student | ROKAF 835th")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal, 20)
            
            Spacer()
        }
        .padding()
    }
}

struct GithubProfileView_Previews: PreviewProvider {
    static var previews: some View {
        GithubProfileView()
    }
}
