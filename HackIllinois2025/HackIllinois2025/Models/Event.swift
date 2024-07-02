//
//  Event.swift
//  HackIllinois2025
//
//  Created by Anushka Sankaran on 7/1/24.
//

import Foundation

struct Event: Codable, Hashable {
    var eventId: String
    var name: String
    var description: String
    var eventType: String
    var startTime: Int
    var endTime: Int
    var mapImageUrl: String
}
