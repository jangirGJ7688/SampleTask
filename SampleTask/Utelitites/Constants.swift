//
//  Constants.swift
//  SampleTask
//
//  Created by Ganpat Jangir on 01/05/24.
//

import Foundation
import UIKit

struct AppConstants {
    static let homePageUrl = "https://api.inopenapp.com/api/v1/dashboardNew"
    static let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
    
    func rgba(_ red: Int,_ green: Int,_ blue: Int, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: alpha)
    }
    
    func rcode(_ value: Int,alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: CGFloat(value)/255.0, green: CGFloat(value)/255.0, blue: CGFloat(value)/255.0, alpha: alpha)
    }
    
    func greetingLogic() -> String {
        let date = NSDate()
        let calendar = NSCalendar.current
        let currentHour = calendar.component(.hour, from: date as Date)
        let hourInt = Int(currentHour.description)!
        var greeting = ""
        if hourInt >= 12 && hourInt <= 16 {
            greeting = "Good Afternoon"
        }
        else if hourInt >= 7 && hourInt <= 12 {
            greeting = "Good Morning"
        }
        else if hourInt >= 16 && hourInt <= 20 {
            greeting = "Good Evening"
        }
        else if hourInt >= 20 && hourInt <= 24 {
            greeting = "Good Night"
        }
        else if hourInt >= 0 && hourInt <= 7 {
            greeting = "You should be sleeping right now"
        }
        return greeting
    }
}
