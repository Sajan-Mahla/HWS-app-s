//
//  ContentView.swift
//  InstaFilter
//
//  Created by SAJAN  on 17/09/25.
//


import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import SwiftUI
import StoreKit

struct ContentView: View {
    
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    @State private var ShowingFilter = false
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
 
    let context = CIContext()
    
    var body: some View {
        VStack{
            Spacer()
            
            PhotosPicker(selection: $selectedItem){
                if let processedImage{
                    processedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("tap to import the Picture"))
                }
            }
            .onChange(of: selectedItem, LoadImage)
            
            Spacer()
            HStack{
                Text("Intensity")
                Slider(value: $filterIntensity)
                    .onChange(of: filterIntensity, applyProcessing)
            }
            HStack{
                Button("Change Filter", action: changefilter)
                
                Spacer()
                
                if let processedImage {
                                       ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))
                                   }
            }
        }
        .padding([.horizontal, .bottom])
        .navigationTitle("InstaFilter")
        .confirmationDialog("Select a Filter", isPresented: $ShowingFilter){
            Button("Crystallize"){ setFilter(CIFilter.crystallize())}
            Button("Edges"){ setFilter(CIFilter.edges())}
            Button("Gaussian Blur"){ setFilter(CIFilter.gaussianBlur())}
            Button("Pixalate"){ setFilter(CIFilter.pixellate())}
            Button("Sepia Tone"){ setFilter(CIFilter.sepiaTone())}
            Button("Unsharp Mask"){ setFilter(CIFilter.unsharpMask())}
            Button("Vigentte"){ setFilter(CIFilter.vignette())}
            Button("Cancel", role: .cancel) { }
            
        }
    }
    func changefilter(){
        ShowingFilter = true
    }
    
    func LoadImage(){
        Task{
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else {return}
            guard let inputImage = UIImage(data: imageData) else {return}
            
            
            let BeginImage = CIImage(image: inputImage)
            currentFilter.setValue(BeginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    func applyProcessing(){
        let inputKeys = currentFilter.inputKeys

              if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
              if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
              if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage else {return}
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {return}
        
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
    
  @MainActor  func setFilter (_ filter: CIFilter){
        currentFilter = filter
        LoadImage()
        filterCount += 1
        
        if filterCount >= 20{
            requestReview()
        }
        
    }
}

#Preview{
    ContentView()
}
