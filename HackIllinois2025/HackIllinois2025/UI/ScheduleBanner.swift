//
//  ScheduleBanner.swift
//  HackIllinois2025
//
//  Created by Anushka Sankaran on 7/2/24.
//

import SwiftUI

struct ScheduleBanner: View {
    var body: some View {
        ZStack {
            Image("Banner")
                .resizable().scaledToFit()
            Text("S C H E D U L E")
                .font(.largeTitle)
                .bold()
                .shadow(color: .gray, radius: 5)
        }
        .padding(.top, 50)
    }
}

#Preview {
    ScheduleBanner()
}
