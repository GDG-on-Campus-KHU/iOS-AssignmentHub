//
//  SprintChallenge_Timer.swift
//  GDG-WeeklyiOS-binschocolate
//
//  Created by 박현빈 on 11/16/24.
//

import SwiftUI

struct SprintChallenge_Timer: View {
    
    @State private var timeremaining : Int = 60
    @State private var progress : CGFloat = 1.0
    @State private var isrunning : Bool = false
    
    private let progresscircleWidth: CGFloat = UIScreen.main.bounds.width - 40
    private let totaltime : Int = 60
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var min : Int = 0
    @State private var sec : Int = 0
    @State private var currentTime: String = ""
   
    var body: some View {
        VStack{
            ZStack{
                prgressivecircleview(progress: progress, width: progresscircleWidth)
                
                /*Circle()
                    .frame(width: 350)
                Circle()
                    .stroke(lineWidth: 10)
                    .frame(width: 300)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)*/
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 120, height: 30)
                            .foregroundColor(.gray)
                        Text("GCU . KHU")
                            .foregroundColor(.black)
                        //.offset(y:-10)
                    }
                    Text("GDG ON CAMPUS")
                        .font(.title)
                        .foregroundColor(.black)
                        .offset(y:10)
                    
          
                    Text(formatTime(timeremaining))
                        .foregroundStyle(.black)
                        .font(.system(size: 50))
                        .offset(y:20)
                    //timeheaderview(timeremaining: timeremaining)
                   
                        
                }
            }
            
            startbutton(isrunning: isrunning, progress: progress, startaction: startcountdown, resetaction: resetcountdown)
            
                
                .onReceive(timer) { _ in
                    updatecountdown()
                    
                }
        }
    }
}
/// "MM:SS" 형식으로 format
private func formatTime(_ seconds: Int) -> String {
    let minutes = seconds / 60
    let seconds = seconds % 60
    return String(format: "%02d:%02d", minutes, seconds)
}

private extension SprintChallenge_Timer{
    //countdown 시작
    private func startcountdown() {
        timeremaining = totaltime
        progress=1.0
        isrunning=true
    }
    
    private func resetcountdown(){
        timeremaining=totaltime
        progress=1.0
        isrunning=false
    }
    
    //타이머 돌아가는중
    private func updatecountdown() {
        if isrunning && timeremaining>0{
            timeremaining-=1
            progress = CGFloat(timeremaining)/CGFloat(totaltime)
        }
        else if timeremaining==0{
            isrunning=false
        }
        
    }
}

fileprivate struct timeheaderview: View {
    let timeremaining : Int
    
    var body : some View {
        Text("\(timeremaining)")
            //.font(.headline)
            .foregroundStyle(.black)
            .font(.system(size: 50))
            .offset(y:20)
    }
}

fileprivate struct startbutton: View {
    let isrunning : Bool
    let progress : CGFloat
    let startaction: ()->Void
    let resetaction: ()->Void
    
    var body: some View{
        
        HStack(spacing : 40){
            Button(action: startaction) {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 120, height: 50)
                    Text("Start")
                        .foregroundColor(.white)
                }
            }
            .disabled(isrunning)
            .opacity(isrunning ? 0.5 : 1.0)
            
            Button(action: resetaction) {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 120, height: 50)
                    Text("Reset")
                        .foregroundColor(.white)
                }
            }
            .disabled(!isrunning)
            .opacity(!isrunning ? 0.5 : 1.0)
        }
    }
}

fileprivate struct prgressivecircleview : View {
    let progress : CGFloat
    let width : CGFloat
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 350)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.blue,
                    style: StrokeStyle(lineWidth: 10, lineCap: .round)
                )
                .frame(width: 320)
                .rotationEffect(.degrees(-90)) // 시작점을 위쪽으로 이동
                .animation(.easeInOut(duration: 0.1), value: progress)
            Circle()
                //.trim(from: 0, to: progress)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(width: 25)
                .offset(y:-160)
                .rotationEffect(.degrees(progress * 360))
                .animation(.easeInOut(duration: 0.1), value: progress)
        
        }
        
    }
    
}

#Preview {
    SprintChallenge_Timer()
}
