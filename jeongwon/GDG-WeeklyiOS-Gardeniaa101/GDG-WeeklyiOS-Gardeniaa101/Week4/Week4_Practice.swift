//
//  Week4_Practice.swift
//  GDG-WeeklyiOS-Gardeniaa101
//
//  Created by HanJW on 11/5/24.
//

import SwiftUI

struct Week4_Practice: View {
    var body: some View {
        VStack() {
            ZStack(){
                Image("github_profile")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                    .padding()
                    .background(
                        Circle()
                            .stroke(Color(.lightGray), lineWidth: 2)
                        //                            .padding()
                    )
                    .frame(width: 300, height: 300)
                
                Text("🦊")
                    .padding()
                    .background(
                        Circle()
                            .stroke(Color(.lightGray), lineWidth: 1)
                            .background(.white)
                    )
                    .frame(width: 60, height: 60)
                    .offset(x: 130, y: 100)
            }
            
            Text("한정원 / Han Jeongwon")
                .font(.system(size: 26))
                .bold()
                .frame(width: 300, height: 26, alignment: .leading)
            
            Text("Gardeniaa101 · she/her")
                .font(.system(size: 23))
                .frame(width: 300, height: 23, alignment: .leading)
                .foregroundStyle(Color(.darkGray))
            
            Button {
                
            } label: {
                Text("Follow")
                    .foregroundStyle(.black)
                    .bold()
                    .frame(width: 300, height: 40)
                    .background(Color("github_gray"))
                    .border(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(10)
            }
            
            Text("\"Lorem ipsum dolor sit amet\"")
                .font(.system(size: 18))
                .frame(width: 300, height: 18, alignment: .leading)
                .foregroundStyle(Color(.darkGray))
        }
    }
}

#Preview {
    Week4_Practice()
}
