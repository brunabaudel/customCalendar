//
//  MonthHeaderView.swift
//  CustomCalendar
//
//  Created by Bruna Baudel on 13/10/23.
//

import SwiftUI

struct MonthHeaderView: View {
    @ObservedObject var vm: CalendarViewModel
    @Binding var showModal: Bool
    
    var body: some View {
        HStack {
            Button {
                vm.chooseMonthBefore()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(vm.color)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Button {
                withAnimation(.linear(duration: 0.5)) {
                    showModal.toggle()
                }
            } label: {
                Capsule()
                    .fill(vm.color)
                    .frame(width: 150, height: 50)
                    .overlay(
                        HStack {
                            Text("\(String(Months.allCases[vm.calendar.month - 1].rawValue)) \(String(vm.calendar.year))")
                                .font(.title2)
                                .foregroundColor(.white)
                            Image(systemName: "chevron.down")
                                .foregroundColor(.white)
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                    )
            }
            
            Spacer()
            
            Button {
                vm.chooseMonthAfter()
            } label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(vm.checkMonthYear() ? vm.color.opacity(0.3) : vm.color)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .disabled(vm.checkMonthYear())
        }
    }
}

struct MonthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MonthHeaderView(vm: CalendarViewModel(), showModal: .constant(false))
    }
}

