//
//  CalendarView.swift
//  CustomCalendar
//
//  Created by Bruna Baudel on 19/09/23.
//

import SwiftUI

struct CalendarView: View {
    private let gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 7)
    
    @ObservedObject var vm = CalendarViewModel()
    @State var showModal: Bool = false
    @State var showModalYear: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 30) {
                    MonthHeaderView(vm: vm, showModal: $showModal)
                    
                    LazyVGrid(columns: gridLayout, spacing: 20) {
                        ForEach(WeekDays.allCases, id: \.self) { weekday in
                            Text(weekday.rawValue)
                                .foregroundColor(vm.color)
                        }
                        
                        ForEach(2-vm.calendar.startWeekDay...vm.calendar.daysInMonth,
                                id: \.self) { day in
                            Button {
                                print("click")
                            } label: {
                                if day >= 1 {
                                    DayView(vm: vm, day: day)
                                }
                            }
                            .disabled(vm.checkCurrentDate(day: day))
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                
                ModalView(showModal: $showModal, content:
                        ModalMonthsView(vm: vm, showModal: $showModal, showModalYear: $showModalYear))
                
                ModalView(showModal: $showModalYear, paddingVertical: 100, opacity: 0, content:
                        ModalYearsView(vm: vm, showModalYear: $showModalYear))
            }
            .toolbar {
                ColorPicker("", selection: $vm.color)
                    .padding(.horizontal)
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
