//
//  LaunchScreen.swift
//  HackIllinois2025
//
//  Created by Anushka Sankaran on 7/2/24.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            Schedule()
        } else {
            ZStack {
                Schedule()
                ZStack {
                    Color(red: 16/255, green: 56/255, blue: 125/255).ignoresSafeArea()
                    VStack {
                        Image("Launch")
                            .resizable().scaledToFit()
                            .frame(width: 250)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear(){
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true;
                        }
                    }
            }
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
