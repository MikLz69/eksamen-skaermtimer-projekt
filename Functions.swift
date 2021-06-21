//
//  Functions.swift
//  Skærmtimer app
//
//  Created by Elev GF2 on 10/06/2021.
//

import Foundation
class Functions {
    
    
    static func checkTimeString(_ timeString: String) -> Bool{
        
        return timeString.range(of: #"^[0-2]?\d:[0-5]?\d$"#, options: .regularExpression) != nil
    }
    // denne function bestemmer hvad der kan stå i et textfield
    
    static func sanitizeInput(_ start: String, _ stop: String) -> Bool {
        
        if (!Functions.checkTimeString(start) || !Functions.checkTimeString(stop)) {
            return false
        }
        return true
    }
    //denne function sørger for at tidspunktet er skrevet rigtigt.
    
    
    static func getMinutesFromTimeString(timeString: String) -> Int{
        let timeStringSplit = timeString.split(separator: ":")
        let hours = timeStringSplit[0]
        let minutes = timeStringSplit[1]
        print(timeStringSplit)
        return Int(hours)! * 60 + Int(minutes)!;
    }
    // denne function ber om et tidspunkt og splitter hours og minutes med et kolon
    
    static func clamp(_ value: Int, _ min: Int, _ max: Int) -> Int{
        if (value < min){
            return min
        }
        if (value > max){
            return max
        }
        return value
    }
    //denne function vil bruge en tidsinterval hvor den vil se om starttiden er er større end value og hvis den er det vil functionen stoppe, det samme med vis sluttiden er mindre en value. Hvis ingen af de ting sker vil den return value.
    
    static func getFormattedStringFromMinutes(minutes: Int) -> String {
    
        let hours = Int(minutes / 60)
        let minutes = Int(minutes - hours * 60)
        
        
        if hours == 0 {
            return "you've been using your computer for \(minutes) minutes!"
        }
        else if minutes == 0 {
        return "you've been using your computer for \(hours) hours!"
        }
        else {
            return "you've been using your computer for \(hours) hours and \(minutes) minutes!"
        }
    }
    //denne function beregner timer og minuter og laver en string hvor der står timer og minutter
}
