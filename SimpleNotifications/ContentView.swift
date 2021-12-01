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
            Button("Request permissions") {
                notify.askPermission()
            }
            Spacer()
            DatePicker("Pick a date:", selection: $selectedDate, in: Date()...)
            Button("Schedule notification") {
                notify.sendNotification(date:selectedDate, type: "date")
                
            }.tint(.orange)
            Spacer()
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
