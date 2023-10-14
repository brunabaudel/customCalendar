//
//  ModalView.swift
//  CustomCalendar
//
//  Created by Bruna Baudel on 20/09/23.
//

import SwiftUI

struct ModalView<Content:View>: View {
    @Binding var showModal: Bool
    var paddingVertical: Double = 200
    var opacity: Double = 0.7
    let content: Content
    
    var body: some View {
        ZStack {
            if showModal {
                Color.black.opacity(opacity).ignoresSafeArea()
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                    content
                }
                .padding(.horizontal, 50)
                .padding(.vertical, paddingVertical)
            }
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(showModal: .constant(true), content: Text("Content"))
    }
}
