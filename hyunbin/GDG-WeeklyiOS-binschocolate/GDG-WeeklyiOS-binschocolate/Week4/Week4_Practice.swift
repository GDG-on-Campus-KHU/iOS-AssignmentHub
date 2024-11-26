//
//  Week4_Practice.swift
//  GDG-WeeklyiOS-binschocolate
//
//  Created by 박현빈 on 11/5/24.
//

import SwiftUI

struct Week4_Practice: View {
    var body: some View {
        VStack{
            Image("week4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .padding(24)
            //.border(.yellow)
            VStack(alignment: .leading) {
                
            
                VStack{
                    Text("Hyunbin Park")
                        .padding(.leading,-185)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("bincshocolate")
                        .padding(.leading,-180)
                }
            }
            
        }
        
        Button {
            print("UnFollow")
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 12.0)
                    .frame(height: 70)
                    .foregroundColor(.gray)
                Text("Follow")
                    .foregroundStyle(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }
     Text("Turn your ideas into reality")
            .padding(.leading,-180)
    }
}

#Preview {
    Week4_Practice()
}
