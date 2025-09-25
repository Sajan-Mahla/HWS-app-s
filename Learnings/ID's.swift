//
//  ID's.swift
//  Bucket List
//
//  Created by SAJAN  on 22/09/25.
//

import LocalAuthentication
import SwiftUI

struct ID_s: View {
    @State private var IsUnlocked = false
    
    var body: some View {
        VStack{
            if IsUnlocked{
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    func authenticate(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason){ success, authenticationError in
                if success {
                    IsUnlocked = true
                } else{
                    // there was a problem
                }
                
            }
        } else {
            // no biometrics
        }
    }
}

#Preview {
    ID_s()
}
