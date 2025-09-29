//
//  OneACCESS.swift
//  Accessibility SandBox
//
//  Created by SAJAN  on 27/09/25.
//
// how accessiblity voiceover help in image reading. 
import SwiftUI

struct OneACCESS: View {
    let pictures = [
        "ales-krivec-15949",
               "galina-n-189483",
               "kevin-horstmann-141705",
               "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "SunFlower",
        "Berry",
        "FireWorks"
    ]
        
    
    @State private var selectedpictures = Int.random(in: 0...3)
    var body: some View {
        
        Button{
            selectedpictures = Int.random(in: 0...3)
        } label: {
            Image(pictures[selectedpictures])
            .resizable()
            .scaledToFit()
        }
            .accessibilityLabel(labels[selectedpictures])
    }
}



#Preview {
    OneACCESS()
}
