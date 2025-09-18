//
//  SwiftUIView.swift
//  InstaFilter
//
//  Created by SAJAN  on 17/09/25.
//


import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct SwiftUIView: View {
    @State private var image: Image?
    var body: some View {
        
        VStack{
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    func loadImage() {
        let inputImage = UIImage(resource: .SAJAN)
        let beginImage = CIImage(image: inputImage)
        
        
        let context = CIContext()
        let currentfilter = CIFilter.pixellate()
        
        
        currentfilter.inputImage = beginImage
        let amount = 1.0
        let inputKeys = currentfilter.inputKeys
        
        
        if inputKeys.contains(kCIInputIntensityKey){
            currentfilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey){
            currentfilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey){
            currentfilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }
        
        
        guard let outputImage = currentfilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent)
                else {return}
        
        
        let uiImage = UIImage(cgImage: cgImage)
        image = Image(uiImage: uiImage)
    }
}
#Preview {
    ContentView()
}

