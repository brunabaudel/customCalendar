//
//  ModalYearsView.swift
//  CustomCalendar
//
//  Created by Bruna Baudel on 19/09/23.
//

import SwiftUI

struct ModalYearsView: View {
    @ObservedObject var vm: CalendarViewModel
    @Binding var showModalYear: Bool

    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach((1900...vm.currentDate.year).reversed(), id: \.self) { year in
                Button {
                    vm.chooseYear(year: year)
                    withAnimation(.easeIn(duration: 0.1)) {
                        showModalYear = false
                    }
                    
                } label: {
                    Capsule()
                        .fill(.white)
                        .frame(height: 45)
                        .overlay(
                            Text(String(year))
                                .font(.title2)
                                .foregroundColor(vm.color)
                        )
                }
            }
        }
        .padding(16)
        .background(vm.color)
        .cornerRadius(10)
    }
}

struct ModalYearsView_Previews: PreviewProvider {
    static var previews: some View {
        ModalYearsView(vm: CalendarViewModel(), showModalYear: .constant(false))
    }
}
