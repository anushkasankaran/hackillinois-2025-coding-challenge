//
//  Schedule.swift
//  HackIllinois2025
//
//  Created by Anushka Sankaran on 7/1/24.
//

import SwiftUI

struct Schedule: View {
    @StateObject var schedule = ScheduleItemModel()
    @State var tab: Int = 0
    @State private var selection = "All"
    @State var types: [String] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    Spacer().frame(height: 160)
                    ForEach(schedule.eventsArray, id: \.self) { ev in
                        if (tab == 0 && getDay(unixTime: ev.startTime) == "23") || (tab == 1 && getDay(unixTime: ev.startTime) == "24") || (tab == 2 && getDay(unixTime: ev.startTime) == "25") {
                            if (selection == "All") || (selection == ev.eventType) {
                                NavigationLink {
                                    EventTicket(event: ev)
                                } label: {
                                    EventCard(event: ev)
                                        .padding(.horizontal, 20)
                                        .padding(.bottom, 10)
                                }
                            }
                        }
                    }
                    .navigationBarHidden(true)
                    .navigationTitle("")
                }
                .background(
                    Image("Background")
                        .resizable()
                        .frame(height: UIScreen.main.bounds.height + 50)
                        .brightness(-0.15)
                )
                VStack {
                    ZStack {
                        ScheduleBanner()
                            .ignoresSafeArea()
                        HStack {
                            Button {
                                tab = 0
                            } label: {
                                if tab == 0 {
                                    Text("Feb 23")
                                        .font(.title2)
                                        .underline()
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding(.leading, 50)
                                } else {
                                    Text("Feb 23")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .padding(.leading, 50)
                                }
                            }
                            Spacer()
                            Button {
                                tab = 1
                            } label: {
                                if tab == 1 {
                                    Text("Feb 24")
                                        .font(.title2)
                                        .underline()
                                        .bold()
                                        .foregroundColor(.white)
                                } else {
                                    Text("Feb 24")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                }
                            }
                            Spacer()
                            Button {
                                tab = 2
                            } label: {
                                if tab == 2 {
                                    Text("Feb 25")
                                        .font(.title2)
                                        .underline()
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding(.trailing, 50)
                                } else {
                                    Text("Feb 25")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .padding(.trailing, 50)
                                }
                            }
                        }
                        .padding(.top, 90)
                    }
                    .padding(.bottom)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Picker("Select a paint color", selection: $selection) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    .accentColor(.white)
                    .pickerStyle(.menu)
                    .foregroundColor(.white)
                }
                .padding(.bottom, 440)
            }
        }
        .task {
            await schedule.getData()
            await schedule.sortData()
            types = schedule.getTypes()
        }
    }
}

#Preview {
    Schedule()
}
