//
//  fourACCESS.swift
//  Accessibility SandBox
//
//  Created by SAJAN  on 29/09/25.
//

import SwiftUI

struct fourACCESS: View {
    var body: some View {
        Button("John Fitzgerald Kennedy"){
            print("Button TAPPED")
        }
        .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
        .padding()
        .foregroundStyle(.white)
        .background(Color.blue)
        .clipShape(.capsule)
    }
}

#Preview {
    fourACCESS()
}
