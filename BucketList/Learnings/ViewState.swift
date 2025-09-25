//
//  ViewState.swift
//  Bucket List
//
//  Created by SAJAN  on 20/09/25.
//
// SWITCHING VIEW STATE WITH Enum.



import SwiftUI
struct LoadingView: View {
    var body: some View {
        Button("Loading"){
           
        }
        .foregroundStyle(.white)
        .padding()
        .glassEffect(.clear.tint(.yellow))
    }
}
struct SuccesView: View {
    var body: some View {
        Button("Success"){
           
        }
        .foregroundStyle(.white)
        .padding()
        .glassEffect(.clear.tint(.green))
    }
}

struct FailedView: View {
    var body: some View {
        Button("Failed"){
           
        }
        .foregroundStyle(.white)
        .padding()
        .glassEffect(.clear.tint(.red))
    }
}

struct ViewState: View {
    enum LoadingState {
        case loading, success, failed
    }
    
    @State private var loadingState = LoadingState.failed
    var body: some View {
        if loadingState == .loading{
            LoadingView()
        } else if loadingState == .success{
            SuccesView()
        } else {
            FailedView()
        }
    }
    
}

#Preview {
    ViewState()
}
