//
//  Date+Extension.swift
//  CustomCalendar
//
//  Created by Bruna Baudel on 20/11/23.
//

import Foundation

extension Date {
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
    func startWeekDay(_ month: Int? = nil, _ year: Int? = nil) -> Int {
        var dateComponents = DateComponents()
        dateComponents.year = year ?? get(.year)
        dateComponents.month = month ?? get(.month)
        dateComponents.day = 1
        
        if let d = Calendar.current.date(from: dateComponents),
           let day = Calendar.current.dateComponents(in: .current, from: d).weekday
        { return day }
        return -1
    }
    
    func daysInMonth(_ month: Int? = nil, _ year: Int? = nil) -> Int {
        var dateComponents = DateComponents()
        dateComponents.year = year ?? get(.year)
        dateComponents.month = month ?? get(.month)
        if
            let d = Calendar.current.date(from: dateComponents),
            let interval = Calendar.current.dateInterval(of: .month, for: d),
            let days = Calendar.current.dateComponents([.day], from: interval.start, to: interval.end).day
        { return days }
        return -1
    }
}
