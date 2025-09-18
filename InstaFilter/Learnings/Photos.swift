//
//  Photos.swift
//  InstaFilter
//
//  Created by SAJAN  on 16/09/25.
//

import PhotosUI
import SwiftUI

struct Photos: View {
    @State private var pickerItem = [PhotosPickerItem]()
    @State private var selectedImage = [Image]()
    
    
    var body: some View {
        VStack{
            PhotosPicker("Select a picture",selection: $pickerItem, maxSelectionCount: 3, matching: .any(of: [.images, .not(.screenshots)]))
            
            ScrollView{
                ForEach(0..<selectedImage.count, id: \.self) { i in
                    selectedImage[i]
                        .resizable()
                        .scaledToFit()
                    
                }
            }
            
        }
        .onChange(of: pickerItem){
            Task{
                selectedImage.removeAll()
                
                for item in pickerItem{
                    if let loadedImage = try await item.loadTransferable(type: Image.self){
                        selectedImage.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    Photos()
}
