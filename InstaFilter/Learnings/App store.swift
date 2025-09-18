//
//  App store.swift
//  InstaFilter
//
//  Created by SAJAN  on 16/09/25.
//
import StoreKit
import SwiftUI

struct App_store: View {
    
    @Environment(\.requestReview) var requestreview
    
    var body: some View {
        Button("Leave a review"){
            requestreview()
        }
        .padding()
        .foregroundStyle(.blue)
        
    }
}

#Preview {
    App_store()
}
