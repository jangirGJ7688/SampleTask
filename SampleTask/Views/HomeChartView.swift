//
//  HomeChartView.swift
//  SampleTask
//
//  Created by Ganpat Jangir on 01/05/24.
//

import SwiftUI
import Charts

struct HomeChartView: View {
    private let linearGradient = LinearGradient(gradient: Gradient(colors: [Color.accentColor.opacity(0.4), Color.accentColor.opacity(0)]),
                                        startPoint: .top,
                                        endPoint: .bottom)
    var data : [String:Int] = [:]
    var body: some View {
        VStack{
            HStack{
                Text("Overview")
                    .font(.custom("Figtree-Regular", size: 14))
                    .foregroundColor(Color(AppConstants().rgba(153, 156, 160)))
                Spacer()
                HStack {
                    Text("22 Aug - 23 Sept")
                        .font(.custom("Figtree-Regular", size: 12))
                    Image("clock")
                        .resizable()
                        .frame(width: 9.5,height: 9.5)
                }
                .padding(8.5)
                .overlay(Color(AppConstants().rcode(235)),in: RoundedRectangle(cornerRadius: 6.0).stroke(lineWidth: 1.0))
            }
            .padding()
            Chart {
                ForEach(data.keys.sorted(),id: \.self) { datum in
                    if(data[datum] ?? 0 > 0){
                        LineMark(x: .value("Year", datum),
                                 y: .value("Value", data[datum] ?? 0))
                    }
                }
                ForEach(data.keys.sorted(),id: \.self) { datum in
                    if(data[datum] ?? 0 > 0){
                        AreaMark(x: .value("Year", datum), y: .value("Value", data[datum] ?? 0))
                    }
                }
                .foregroundStyle(linearGradient)
            }
            .padding()
            .foregroundStyle(.blue)
            .chartYAxis() {
                AxisMarks(position: .leading)
            }
        }
        .frame(height: 200)
        .background(Color.white)
        .cornerRadius(8.0)
        
    }
}

#Preview {
    HomeChartView()
}
