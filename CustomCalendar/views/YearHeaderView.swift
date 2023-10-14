//
//  YearHeaderView.swift
//  CustomCalendar
//
//  Created by Bruna Baudel on 13/10/23.
//

import SwiftUI

struct YearHeaderView: View {
    @ObservedObject var vm: CalendarViewModel
    @Binding var showModalYear: Bool
    
    var body: some View {
        HStack {
            Button {
                vm.chooseYearBefore()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(vm.color)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Button {
                withAnimation(.linear(duration: 0.5)) {
                    showModalYear.toggle()
                }
            } label: {
                HStack {
                    Text(String(vm.calendar.year))
                        .foregroundColor(vm.color)
                        .font(.title)
                        .fontWeight(.bold)
                    Image(systemName: "chevron.down")
                        .foregroundColor(vm.color)
                        .font(.caption)
                        .fontWeight(.bold)
                }
            }
            
            Spacer()
            
            Button {
                vm.chooseYearAfter()
            } label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(vm.checkYear() ? vm.color.opacity(0.3) : vm.color)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .disabled(vm.checkYear())
        }
    }
}

struct YearHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        YearHeaderView(vm: CalendarViewModel(), showModalYear: .constant(false))
    }
}
