//
//  twoACCESS.swift
//  Accessibility SandBox
//
//  Created by SAJAN  on 27/09/25.
//
// here we'll learn about Hiding & Grouping the elements.
import SwiftUI

struct twoACCESS: View {
    var body: some View {
        VStack{
            Text("Your Score is ")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
    }
}

#Preview {
    twoACCESS()
}
