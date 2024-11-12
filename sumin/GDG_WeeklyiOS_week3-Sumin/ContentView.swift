//
//  ContentView.swift
//  GDG_WeeklyiOS-Sumin
//
//  Created by SSUM on 10/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            StudentIDCard()
                .padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .systemBackground))
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
