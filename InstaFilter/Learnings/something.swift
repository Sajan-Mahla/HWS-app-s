//
//  something.swift
//  InstaFilter
//
//  Created by SAJAN  on 15/09/25.
//

import SwiftUI

struct something: View {
    var body: some View {
        ContentUnavailableView{
            Label("No Snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets.")
        } actions: {
            Button("Create Snippet") {
               // some code for later on.
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    something()
}
