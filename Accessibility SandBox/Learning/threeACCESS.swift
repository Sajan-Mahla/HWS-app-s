//
//  threeACCESS.swift
//  Accessibility SandBox
//
//  Created by SAJAN  on 27/09/25.
//
// readig the values of control
import SwiftUI

struct threeACCESS: View {
    @State private var value = 10
    var body: some View {

        VStack{
            Text("Value: \(value)")
            
            Button("Increment"){
                value += 1
            }
            .padding()
            .foregroundStyle(.white)
            .background(Color.blue)
            .clipShape(.capsule)
            
            Button("Decrement"){
                value -= 1
            }
            .padding()
            .foregroundStyle(.white)
            .background(Color.blue)
            .clipShape(.capsule)
        }
        .accessibilityElement()
        .accessibilityLabel("Value")
        .accessibilityValue(String(value))
        .accessibilityAdjustableAction{ direction in
            switch direction{
            case .increment:
                value += 1
            case .decrement:
                value -= 1
            default:
                print("Not Handeled")
            }
        }
        
    }
}

#Preview {
    threeACCESS()
}
