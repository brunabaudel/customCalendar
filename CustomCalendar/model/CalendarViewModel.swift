//
//  CalendarViewModel.swift
//  CustomCalendar
//
//  Created by Bruna Baudel on 12/10/23.
//

import SwiftUI

class CalendarViewModel: ObservableObject {
    @Published var color = Color(.blue)
    
    @Published var calendar = CalendarModel(day: Date().get(.day),
                                           month: Date().get(.month),
                                           year: Date().get(.year))
    
    private(set) var currentDate = CalendarModel(day: Date().get(.day),
                                                month: Date().get(.month),
                                                year: Date().get(.year))
    
    func checkCurrentDate(day: Int) -> Bool {
        return  day > currentDate.day && checkMonthYear()
    }
    
    func checkMonthYear() -> Bool {
        return calendar.month >= currentDate.month && checkYear()
    }
    
    func checkMonthYear(with month: Int) -> Bool {
        return month >= currentDate.month && checkYear()
    }
    
    func checkYear() -> Bool {
        return calendar.year >= currentDate.year
    }
    
    func chooseYear(year: Int) {
        calendar.year = year
    }
    
    func chooseMonth(month: Int) {
        calendar.month = month + 1
    }
    
    func chooseMonthBefore() {
        if calendar.month >= 1 {
            calendar.month -= 1
        }
        
        if calendar.month < 1 {
            calendar.month = 12
            calendar.year -= 1
        }
    }
    
    func chooseMonthAfter() {
        if calendar.month <= 12 {
            calendar.month += checkMonthYear() ? 0 : 1
        }
        
        if calendar.month > 12 {
            calendar.month = 1
            calendar.year += 1
        }
    }
    
    func chooseYearBefore() {
        calendar.year -= 1
    }
    
    func chooseYearAfter() {
        calendar.year += checkYear() ? 0 : 1
    }
}

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
