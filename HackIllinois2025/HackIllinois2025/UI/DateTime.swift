//
//  DateTime.swift
//  HackIllinois2025
//
//  Created by Anushka Sankaran on 7/2/24.
//

import SwiftUI

struct DateTime: View {
    var event: Event
    
    var body: some View {
        HStack{
            Image(systemName: "calendar")
            if (formatTime(unixTime: event.startTime) != formatTime(unixTime: event.endTime)) {
                Text(formatDate(unixTime:event.startTime) + " | " + formatTime(unixTime: event.startTime) + " - " + formatTime(unixTime: event.endTime))
                    .font(.caption)
            } else {
                Text(formatDate(unixTime:event.startTime) + " | " + formatTime(unixTime: event.startTime))
                    .font(.caption)
            }
        }.frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    DateTime(event: Event(eventId: "id", name: "Event Name", description: "Event Description", eventType: "Event Type", startTime: 1677348000, endTime: 1677301200, mapImageUrl: "https://raw.githubusercontent.com/HackIllinois/adonix-metadata/main/maps/SiebelFloor2.png"))
}
