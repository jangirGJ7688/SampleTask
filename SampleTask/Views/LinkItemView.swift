//
//  LinkItemView.swift
//  SampleTask
//
//  Created by Ganpat Jangir on 01/05/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct LinkItemView: View {
    @State var item: LinkItem
    let font = UIFont(name: "Figtree-Regular", size: 14)!
    var body: some View {
        VStack(spacing: 0){
            HStack {
                WebImage(url: URL(string: item.original_image ?? "")) { image in
                    image.resizable()
                        .frame(width: 48,height: 48)
                        .cornerRadius(8.0)
                        .overlay(Color(AppConstants().rcode(235)),in:RoundedRectangle(cornerRadius: 8.0).stroke(lineWidth: 1.0))
                } placeholder: {
                    Image("placeholder")
                                        .resizable()
                                        .frame(width: 48,height: 48)
                                        .cornerRadius(8.0)
                                        .padding(.trailing,12)
                }
                VStack(alignment:.leading) {
                    Text(item.title ?? "")
                        .font(.custom("Figtree-Regular", size: 14))
                        .padding(.vertical,(24.0 - font.lineHeight)/2)
                    .lineLimit(1)
                    Text("22 Aug 2022")
                        .font(.custom("Figtree-Regular", size: 12))
                        .padding(.vertical,(18.0 - UIFont(name: "Figtree-Regular", size: 12)!.lineHeight)/2)
                        .foregroundColor(.gray)
                }
                Spacer(minLength: 12)
                VStack(alignment: .leading) {
                    if let totalClicks = item.total_clicks {
                        Text("\(String(describing: totalClicks))")
                            .font(.custom("Figtree-SemiBold", size: 14))
                            .padding(.vertical,(24.0 - UIFont(name: "Figtree-SemiBold", size: 14)!.lineHeight)/2)
                    }
                    Text("Clicks")
                        .font(.custom("Figtree-Regular", size: 12))
                        .padding(.vertical,(18.0 - UIFont(name: "Figtree-Regular", size: 12)!.lineHeight)/2)
                        .foregroundColor(.gray)
                }
            }
            .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
            .frame(height: 72)
            .background(Color.white)
            .clipShape(.rect(topLeadingRadius: 8,
                             bottomLeadingRadius: 0,
                             bottomTrailingRadius: 0,
                             topTrailingRadius: 8))
            HStack {
                Text(item.web_link ?? "")
                    .font(.custom("Figtree-Regular", size: 14))
                    .padding(.vertical,(24.0 - font.lineHeight)/2)
                    .foregroundColor(Color.accentColor)
                Spacer()
                Button(action: {
                    let clipboard = UIPasteboard.general
                    clipboard.setValue(item.web_link, forPasteboardType: "public.plain-text")
                }, label: {
                    Image("copy")
                })
            }
            .padding(.vertical,8)
            .padding(.horizontal,12)
            .frame(height: 40)
            .background(Color(AppConstants().rgba(232, 241, 255)))
            .clipShape(.rect(topLeadingRadius: 0,
                             bottomLeadingRadius: 8,
                             bottomTrailingRadius: 8,
                             topTrailingRadius: 0))
            .overlay(Color(AppConstants().rgba(166, 199, 255)),in: UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 8.0,bottomTrailing: 8.0)).stroke(style: StrokeStyle(lineWidth: 1.0,dash:[5])))
        }
    }
}

//#Preview {
//    LinkItemView(item: Lin)
//}
