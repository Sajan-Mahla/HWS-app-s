//
//  Comparable.swift
//  Bucket List
//
//  Created by SAJAN  on 20/09/25.
//

import SwiftUI

struct User:Identifiable{
    let id = UUID()
    let firstName: String
    let lastName: String
    
    
    static func <(lhs: User, rhs: User) -> Bool{
        lhs.lastName < rhs.lastName
    }
}

struct Comparable: View {
    let Users = [
        User(firstName: "Sajan", lastName: "Mahla"),
        User(firstName: "Harsimranjeet", lastName: "Singh"),
        User(firstName: "Sam", lastName: "MxHLA")
        
    ].sorted(){
        $0.lastName < $1.lastName
    }
    
    var body: some View {
        List(Users) { User in
            Text("\(User.lastName), \(User.firstName)")
        }
    }
}
#Preview {
    Comparable()
}
