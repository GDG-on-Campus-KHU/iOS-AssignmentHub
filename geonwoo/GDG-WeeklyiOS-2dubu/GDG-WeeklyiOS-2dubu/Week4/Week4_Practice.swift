//
//  Week4_Practice.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 11/5/24.
//

import SwiftUI

struct Week4_Practice: View {
    
    @State private var isFollowed: Bool = false
    private let buttonColor: Color = Color(uiColor: UIColor(red: 32/255, green: 40/255, blue: 48/155, alpha: 1))
    private let bg: Color = Color(uiColor: UIColor(red: 13/255, green: 17/255, blue: 22/155, alpha: 1))
    
    var body: some View {
        VStack {
            Image("dev-jeans")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))
                .padding(.horizontal, 2)
            
            Spacer()
                .frame(height: 25)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Geonwoo Lee")
                        .font(.system(size: 30, weight: .bold))
                    
                    Text("2dubu")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundStyle(.gray)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Text("This is GDG Week4 Practice!")
                        .font(.system(size: 20, weight: .medium))
                }
                Spacer()
            }
            
            Button {
                isFollowed.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 50)
                        .foregroundStyle(Color(uiColor: .darkGray))
                    
                    Text(isFollowed ? "Unfollow" : "Follow")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .bold))
                }
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    Week4_Practice()
}
