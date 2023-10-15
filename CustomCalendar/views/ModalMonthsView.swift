//
//  ModalMonthsView.swift
//  CustomCalendar
//
//  Created by Bruna Baudel on 19/09/23.
//

import SwiftUI

struct ModalMonthsView: View {
    private let gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    
    @ObservedObject var vm: CalendarViewModel
    @Binding var showModal: Bool
    @Binding var showModalYear: Bool
    
    var body: some View {
        VStack(spacing: 50) {
            
            YearHeaderView(vm: vm, showModalYear: $showModalYear)
            
            LazyVGrid(columns: gridLayout, spacing: 10) {
                ForEach(Array(Months.getAllCases.enumerated()), id: \.element) { month, element in
                    Button {
                        vm.chooseMonth(month: month)
                        withAnimation(.easeIn(duration: 0.3)) {
                            self.showModal = false
                        }
                    } label: {
                        Capsule()
                            .fill(vm.checkMonthYear(with: month) ? vm.color.opacity(0.6) : vm.color)
                            .frame(height: 50)
                            .overlay(
                                Text(element)
                                    .font(.title3)
                                    .foregroundColor(.white)
                            )
                    }
                    .disabled(vm.checkMonthYear(with: month))
                }
            }
        }
        .padding()
    }
}

struct ModalMonthsView_Previews: PreviewProvider {
    static var previews: some View {
        ModalMonthsView(vm: CalendarViewModel(), showModal: .constant(false), showModalYear: .constant(false))
    }
}
