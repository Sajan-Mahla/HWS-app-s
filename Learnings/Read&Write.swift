//
//  Read&Write.swift
//  Bucket List
//
//  Created by SAJAN  on 20/09/25.
//
//
//import SwiftUI
//
//
//struct Read_Write: View {
//    var body: some View {
//        Button("Read & Write") {
//            let data = Data("Test Message".utf8)
//            let url = URL.documentsDirectory.appending(path: "Message.txt")
//            
//            do{
//                try data.write(to: url, options: [.atomic, .completeFileProtection])
//                let input = try String(contentsOf: url)
//                print(input)
//            } catch{
//                print(error.localizedDescription)
//            }
//        }
//    }
//    
//}
//
//#Preview {
//    Read_Write()
//}
