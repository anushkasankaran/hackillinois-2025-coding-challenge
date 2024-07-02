//
//  EventCard.swift
//  HackIllinois2025
//
//  Created by Anushka Sankaran on 7/1/24.
//

import SwiftUI

struct EventCard: View {
    var event: Event
    
    var body: some View {
        VStack {
            ZStack {
                Image("Tent")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                //Event name
                ZStack {
                    Text(event.name.uppercased())
                        .lineLimit(1)
                        .minimumScaleFactor(0.65)
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                        .padding(4)
                        .padding(.leading, 7)
                        .padding(.trailing, 7)
//                        .shadow(color: .black, radius: 5)
                        .background(
                                            .regularMaterial,
                                            in: RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        )
                    
                }
                .frame(maxWidth: UIScreen.main.bounds.width - 70, alignment: .center)
                .padding(.top, 45)
                
                //Event type
                ZStack {
                    Capsule()
                        .fill(Color(red: 252/255, green: 220/255, blue: 143/255))
                    Text(event.eventType)
                        .padding(4)
                        .foregroundColor(.black)
                        .padding(.leading, 7)
                        .padding(.trailing, 7)
                }
                .fixedSize(horizontal: true, vertical: true)
                .padding(.top, 140)
                
                //Date and Time
                DateTime(event: event)
                    .padding(.top, 195)
                    .foregroundColor(.white)
                
                //Event description
                Text(event.description)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .bold()
                    .lineLimit(2)
                    .frame(width: 255)
                    .padding(.top, 260)
            }
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    EventCard(event: Event(eventId: "id", name: "Event Name", description: "This is a sample event description.", eventType: "Event Type", startTime: 1677348000, endTime: 1677301200, mapImageUrl: "https://raw.githubusercontent.com/HackIllinois/adonix-metadata/main/maps/SiebelFloor2.png"))
}
