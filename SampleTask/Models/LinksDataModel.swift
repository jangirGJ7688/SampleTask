//
//  LinksDataModel.swift
//  SampleTask
//
//  Created by Ganpat Jangir on 01/05/24.
//

import Foundation

struct LinkItem: Decodable,Identifiable {
    let id = UUID().uuidString
    let url_id : Int?
    let web_link : String?
    let smart_link : String?
    let title : String?
    let total_clicks : Int?
    let original_image : String?
    let imageString : String?
    let times_ago : String?
    let created_at : String?
    let domain_id : String?
    let url_prefix : String?
    let url_suffix : String?
    let app : String?
    let is_favourite : Bool?

    enum CodingKeys: String, CodingKey {

        case url_id = "url_id"
        case web_link = "web_link"
        case smart_link = "smart_link"
        case title = "title"
        case total_clicks = "total_clicks"
        case original_image = "original_image"
        case imageString = "thumbnail"
        case times_ago = "times_ago"
        case created_at = "created_at"
        case domain_id = "domain_id"
        case url_prefix = "url_prefix"
        case url_suffix = "url_suffix"
        case app = "app"
        case is_favourite = "is_favourite"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url_id = try values.decodeIfPresent(Int.self, forKey: .url_id)
        web_link = try values.decodeIfPresent(String.self, forKey: .web_link)
        smart_link = try values.decodeIfPresent(String.self, forKey: .smart_link)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        total_clicks = try values.decodeIfPresent(Int.self, forKey: .total_clicks)
        original_image = try values.decodeIfPresent(String.self, forKey: .original_image)
        imageString = try values.decodeIfPresent(String.self, forKey: .imageString)
        times_ago = try values.decodeIfPresent(String.self, forKey: .times_ago)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        domain_id = try values.decodeIfPresent(String.self, forKey: .domain_id)
        url_prefix = try values.decodeIfPresent(String.self, forKey: .url_prefix)
        url_suffix = try values.decodeIfPresent(String.self, forKey: .url_suffix)
        app = try values.decodeIfPresent(String.self, forKey: .app)
        is_favourite = try values.decodeIfPresent(Bool.self, forKey: .is_favourite)
    }
}
