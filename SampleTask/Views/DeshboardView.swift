//
//  DeshboardView.swift
//  SampleTask
//
//  Created by Ganpat Jangir on 22/05/24.
//

import SwiftUI

struct DeshboardView: View {
    var body: some View {
        HStack {
            Text("Deshboard")
                .font(.custom("Figtree-Medium", size: 24))
                .foregroundColor(.white)
            Spacer()
            Image("wrench")
                .resizable()
                .frame(width: 17.5,height: 19)
                .padding(11)
                .background(Color(AppConstants().rcode(255,alpha: 0.2)))
                .cornerRadius(8.0)
        }
        .padding(.horizontal,24)
    }
}

#Preview {
    DeshboardView()
}
