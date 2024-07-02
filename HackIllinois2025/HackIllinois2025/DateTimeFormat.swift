//
//  DateTimeFormat.swift
//  HackIllinois2025
//
//  Created by Anushka Sankaran on 7/2/24.
//

import Foundation

func getPresentDateTime(unixTime: Int) -> String {
    let date = NSDate(timeIntervalSince1970: Double(unixTime))

    let dayTimePeriodFormatter = DateFormatter()
    dayTimePeriodFormatter.dateFormat = "MMM dd YYYY hh:mm a"

    let dateString = dayTimePeriodFormatter.string(from: date as Date)
    
    return dateString
}

func formatDate(unixTime: Int) -> String {
    var date = getPresentDateTime(unixTime: unixTime)
    let monthDay = String(date.prefix(6))
    date = String(date.suffix(13))
    let year = String(date.prefix(4))
    
    return monthDay + ", " + year
}

func formatTime(unixTime: Int) -> String {
    var time = getPresentDateTime(unixTime: unixTime)
    time = String(time.suffix(8))
    if (time[time.startIndex] == "0") {
        time = String(time.suffix(7))
    }
    
    return time
}

func getDay(unixTime: Int) -> String {
    let date = getPresentDateTime(unixTime: unixTime)
    let day = String(date.suffix(16))
    return String(day.prefix(2))
}
