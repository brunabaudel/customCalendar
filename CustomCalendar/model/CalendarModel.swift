//
//  CalendarModel.swift
//  CustomCalendar
//
//  Created by Bruna Baudel on 19/09/23.
//

import Foundation

enum Months: String, CaseIterable {
    case jan = "Jan", feb = "Feb", mar = "Mar", apr = "Apr",
         may = "May", jun = "Jun", jul = "Jul", aug = "Aug",
         sep = "Sep", out = "Out", nov = "Nov", dez = "Dez"
    
    static var getAllCases: [String] {
        return allCases.map{$0.localizedString()}
    }
    
    private func localizedString() -> String {
        return NSLocalizedString(self.rawValue, comment: "Month \(self.rawValue)")
    }
}

enum WeekDays: String, CaseIterable {
    case sun = "Sun", mon = "Mon", tue = "Tue", wen = "Wen",
         thu = "Thu", fri = "Fri", sat = "Sat"
    
    static var getAllCases: [String] {
        return allCases.map{$0.localizedString()}
    }
    
    private func localizedString() -> String {
        return NSLocalizedString(self.rawValue, comment: "Week day \(self.rawValue)")
    }
}

struct CalendarModel {
    var day: Int
    var month: Int
    var year: Int
    var daysInMonth: Int {
        return Date().daysInMonth(month, year)
    }
    var startWeekDay: Int {
        return Date().startWeekDay(month, year)
    }
}
