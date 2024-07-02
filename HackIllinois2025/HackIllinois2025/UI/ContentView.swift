//
//  ContentView.swift
//  HackIllinois2025
//
//  Created by Anushka Sankaran on 7/1/24.
//

import SwiftUI

// Event fields included in API:
// name, description, start time, end time, location: (description)

struct ContentView: View {
    var event: Event
    
    var body: some View {
        VStack {
            ZStack {
                Image("Tent")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                //Event name
                Text(event.name.uppercased())
                    .font(.title)
                    .bold()
                    .foregroundColor(Color(red: 252/255, green: 220/255, blue: 143/255))
                    .padding(.top, 75)
                
                //Event type
                ZStack {
                    Capsule()
                        .fill(Color(red: 252/255, green: 220/255, blue: 143/255))
                    Text(event.eventType)
                        .padding(4)
                        .padding(.leading, 7)
                        .padding(.trailing, 7)
                }
                .fixedSize(horizontal: true, vertical: true)
                .padding(.top, 150)
                
                //Event description
                Text(event.description)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .bold()
                    .lineLimit(2)
                    .frame(width: 275)
                    .padding(.top, 225)
            }
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    ContentView(event: Event(eventId: "id", name: "Event Name", description: "This is a sample event description.", eventType: "Event Type", startTime: 1677348000, endTime: 1677301200, mapImageUrl: "https://raw.githubusercontent.com/HackIllinois/adonix-metadata/main/maps/SiebelFloor2.png"))
}
