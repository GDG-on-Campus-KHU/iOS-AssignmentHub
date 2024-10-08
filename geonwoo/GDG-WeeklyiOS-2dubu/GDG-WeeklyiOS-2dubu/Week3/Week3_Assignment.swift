//
//  Week3_Assignment.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 10/8/24.
//

import SwiftUI

// TODO: - 경희대 학생증 카드 만들어보기
struct Week3_Assignment: View {
    private let kyungheeRed: Color = Color(uiColor: UIColor(red: 164/255, green: 15/255, blue: 24/255, alpha: 1))
    private let kyungheeGold: Color = Color(uiColor: UIColor(red: 192/255, green: 163/255, blue: 83/255, alpha: 1))
    
    private let cardWidth: CGFloat = UIScreen.main.bounds.width - 80
    private let aspectRatio: CGFloat = 1.58 // ratio for a credit card
    
    @State private var translation: CGSize = .zero
    @State private var isDragging = false
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                translation = value.translation
                isDragging = true
            }
            .onEnded { value in
                withAnimation {
                    translation = .zero
                    isDragging = false
                }
            }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 25)
                .fill(kyungheeRed)
                .frame(width: cardWidth, height: cardWidth * aspectRatio)
                .overlay(alignment: .topTrailing) {
                    Text("HANA CARD")
                        .font(.system(size: 10, weight: .light))
                        .foregroundColor(darken(color: kyungheeRed, amount: 0.2))
                        .rotationEffect(Angle(degrees: 90))
                        .offset(x: 5, y: 45)
                }
                .overlay(alignment: .top) {
                    chip
                }
            
            VStack(spacing: 30) {
                Image("kyunghee_icon")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .foregroundStyle(darken(color: kyungheeRed, amount: 0.15))
                    .frame(width: 160, height: 160)
                
                Text("KYUNG HEE UNIVERSITY")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(kyungheeGold)
                    .padding(.bottom, 10)
                
                MasterCardLogo()
            }
            .padding(.bottom, 20)
        }
        .rotation3DEffect(
            .degrees(isDragging ? 10 : 0),
            axis: (x: -translation.height, y: translation.width, z: 0)
        )
        .gesture(drag)
    }
    
    var chip: some View {
        VStack(spacing: 15) {
            Image(systemName: "chevron.up")
                .foregroundStyle(darken(color: kyungheeRed, amount: 0.2))
            
            RoundedRectangle(cornerRadius: 5)
                .fill(kyungheeGold)
                .frame(width: 40, height: 50)
        }
        .offset(x: 25, y: 20)
    }
}

fileprivate struct MasterCardLogo: View {
    private let cardWidth: CGFloat = UIScreen.main.bounds.width - 80
    private let circleSize: CGFloat = 50
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.yellow.opacity(0.9))
                .frame(width: circleSize, height: circleSize)
                .offset(x: 20)
            
            Circle()
                .fill(Color.red.opacity(0.9))
                .frame(width: circleSize, height: circleSize)
                .offset(x: -20)
                .blendMode(.screen)
        }
        .frame(maxWidth: cardWidth, alignment: .trailing)
        .padding(.trailing, 30 + circleSize)
    }
}


#Preview {
    Week3_Assignment()
}
