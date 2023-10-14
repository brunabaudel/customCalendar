//
//  DayView.swift
//  CustomCalendar
//
//  Created by Bruna Baudel on 19/09/23.
//

import SwiftUI

struct DayView: View {
    @ObservedObject var vm: CalendarViewModel
    @State var day: Int
    
    var body: some View {
        VStack(spacing: 4) {
            Text("\(day)")
                .foregroundColor(vm.color)
            
            Image(systemName: "circle")
                .resizable()
                .scaledToFit()
                .foregroundColor(vm.color.opacity(vm.checkCurrentDate(day: day) ? 0.3 : 1))
                .fontWeight(.light)
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(vm: CalendarViewModel(), day: 1)
    }
}
