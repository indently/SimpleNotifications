//
//  ContentView.swift
//  SimpleNotifications
//
//  Created by Federico on 30/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State var selectedDate = Date()
    let notify = Notifications()
    
    var body: some View {
        VStack(spacing: 20) {
            
            DatePicker("Pick a date", selection: $selectedDate)
            Button("Submit date") {
                print("\(selectedDate)")
            }
                
            Button("Request permissions") {
                notify.askPermission()
            }
            Button("Schedule notification") {
                notify.sendNotification(date:selectedDate)
                
            }.tint(.orange)
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
