//
//  ScheduleItem.swift
//  HackIllinois2025
//
//  Created by Anushka Sankaran on 7/1/24.
//

import Foundation

class ScheduleItemModel: ObservableObject {
    
    private struct Returned: Codable {
        var events: [Event]
    }
    
    @Published var eventsArray: [Event] = []
    @Published var endpoint = "https://adonix.hackillinois.org/event/"
    
    func getData() async {
        guard let url = URL(string: endpoint) else {
            print("Could not create URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("Could not decode")
                return
            }
            self.eventsArray = returned.events
        } catch {
            print("Could not read data from URL")
        }
    }
    
    //Sorts Events in array by start time
    func sortData() async {
        self.eventsArray.sort { lhs, rhs in
            lhs.startTime < rhs.startTime
        }
    }
    
    func getTypes() -> [String] {
        var ret: [String] = ["All"]
        for e in eventsArray {
            if !ret.contains(e.eventType) {ret.append(e.eventType)}
        }
        return ret.sorted()
    }
}
