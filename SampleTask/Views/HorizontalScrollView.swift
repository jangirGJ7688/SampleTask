//
//  HorizontalScrollView.swift
//  SampleTask
//
//  Created by Ganpat Jangir on 20/05/24.
//

import SwiftUI

struct HorizontalScrollView: View {
    let item: HoriData
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            Image(item.loco)
                .resizable()
                .frame(width: 32,height: 32)
                .cornerRadius(16)
            Text(item.value)
                .font(.custom("Figtree-Medium", size: 16))
            Text(item.key)
                .font(.custom("Figtree-Regular", size: 14))
                .foregroundColor(Color(AppConstants().rgba(153, 156, 160)))
        }
        .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 23))
        .frame(width: 120,height: 120)
        .background(Color.white)
        .cornerRadius(8.0)
    }
}

#Preview {
    HorizontalScrollView(item: HoriData(key: "Todays Click", value: "123", loco: "h1"))
}
