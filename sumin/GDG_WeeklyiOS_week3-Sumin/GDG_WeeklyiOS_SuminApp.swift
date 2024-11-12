////  GDG_WeeklyiOS_SuminApp.swift
//  GDG_WeeklyiOS-Sumin
//

import SwiftUI

@main
struct GDG_WeeklyiOS_SuminApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct StudentIDCard: View {
    var body: some View {
        ZStack {
            // 카드 배경
            Rectangle()
                .fill(Color(red: 0.6, green: 0.1, blue: 0.1)) // Kyung Hee University 컬러에 가까운 어두운 빨간색
                .frame(width: 200, height: 320)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            VStack {
                Spacer().frame(height: 30)
                
                // IC 칩
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color(red: 0.85, green: 0.8, blue: 0.5))
                    .frame(width: 40, height: 30)
                    .overlay(
                        VStack(spacing: 2) {
                            Rectangle()
                                .fill(Color(red: 0.6, green: 0.5, blue: 0.3))
                                .frame(width: 30, height: 4)
                            Rectangle()
                                .fill(Color(red: 0.6, green: 0.5, blue: 0.3))
                                .frame(width: 30, height: 4)
                            Rectangle()
                                .fill(Color(red: 0.6, green: 0.5, blue: 0.3))
                                .frame(width: 30, height: 4)
                        }
                    )
                
                Spacer().frame(height: 20)
                
                // 중앙 로고 부분
                Image("khu_logo") // 실제 로고 이미지를 대체
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(Color(red: 0.4, green: 0.1, blue: 0.1, opacity: 0.3))
                
                Spacer().frame(height: 20)
                
                // 학교명 텍스트
                Text("KYUNG HEE UNIVERSITY")
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(.yellow)
                    .padding(.bottom, 20)
                
                Spacer()
                
                // 마스터카드 로고
                HStack(spacing: -10) {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 30, height: 30)
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 30, height: 30)
                }
                
                Spacer().frame(height: 20)
            }
        }
        .frame(width: 200, height: 320)
    }
}

// 프리뷰
struct StudentIDCard_Previews: PreviewProvider {
    static var previews: some View {
        StudentIDCard()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
