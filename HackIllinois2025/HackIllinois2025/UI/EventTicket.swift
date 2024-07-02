//
//  EventTicket.swift
//  HackIllinois2025
//
//  Created by Anushka Sankaran on 7/1/24.
//

import SwiftUI

struct EventTicket: View {
    var event: Event
    
    var body: some View {
        ZStack {
            Image("Ticket")
                .resizable()
            .shadow(color: .white, radius: 10)
            
            ScrollView {
                Text(event.name.uppercased())
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .bold()
                    .underline()
                    .padding(.bottom, 10)
                
                DateTime(event: event)
                    .font(.subheadline)
                    .padding(.bottom, 10)
                    
                
                Text(event.description)
                
                AsyncImage(url: URL(string: event.mapImageUrl)) { image in
                    image.resizable()
                } placeholder: {
                    Color(red: 255/255, green: 228/255, blue: 204/255)
                }
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 25))
            }
            .padding(.leading)
            .frame(maxWidth: UIScreen.main.bounds.width - 120, maxHeight: 370, alignment: .center)
        }
        .background(
            Image("Background")
                .resizable()
                .frame(height: UIScreen.main.bounds.height + 75)
        )
    }
}

#Preview {
    EventTicket(event: Event(eventId: "id", name: "Long event name to test title.", description: "This is a sample event description.", eventType: "Event Type", startTime: 1677348000, endTime: 1677301200, mapImageUrl: "https://raw.githubusercontent.com/HackIllinois/adonix-metadata/main/maps/SiebelFloor2.png"))
}
