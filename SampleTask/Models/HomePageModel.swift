//
//  HomePageModel.swift
//  SampleTask
//
//  Created by Ganpat Jangir on 01/05/24.
//

import Foundation

struct HomePageModel: Decodable {
    let status : Bool?
    let statusCode : Int?
    let message : String?
    let support_whatsapp_number : String?
    let extra_income : Double?
    let total_links : Int?
    let total_clicks : Int?
    let today_clicks : Int?
    let top_source : String?
    let top_location : String?
    let startTime : String?
    let links_created_today : Int?
    let applied_campaign : Int?
    let data : HomePageData?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case statusCode = "statusCode"
        case message = "message"
        case support_whatsapp_number = "support_whatsapp_number"
        case extra_income = "extra_income"
        case total_links = "total_links"
        case total_clicks = "total_clicks"
        case today_clicks = "today_clicks"
        case top_source = "top_source"
        case top_location = "top_location"
        case startTime = "startTime"
        case links_created_today = "links_created_today"
        case applied_campaign = "applied_campaign"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        support_whatsapp_number = try values.decodeIfPresent(String.self, forKey: .support_whatsapp_number)
        extra_income = try values.decodeIfPresent(Double.self, forKey: .extra_income)
        total_links = try values.decodeIfPresent(Int.self, forKey: .total_links)
        total_clicks = try values.decodeIfPresent(Int.self, forKey: .total_clicks)
        today_clicks = try values.decodeIfPresent(Int.self, forKey: .today_clicks)
        top_source = try values.decodeIfPresent(String.self, forKey: .top_source)
        top_location = try values.decodeIfPresent(String.self, forKey: .top_location)
        startTime = try values.decodeIfPresent(String.self, forKey: .startTime)
        links_created_today = try values.decodeIfPresent(Int.self, forKey: .links_created_today)
        applied_campaign = try values.decodeIfPresent(Int.self, forKey: .applied_campaign)
        data = try values.decodeIfPresent(HomePageData.self, forKey: .data)
    }
}

struct HomePageData: Decodable {
    let recent_links : [LinkItem]?
    let top_links : [LinkItem]?
    let favourite_links : [LinkItem]?
    let charData : [String:Int]?
    var horizontalData: [HoriData]?

    enum CodingKeys: String, CodingKey {

        case recent_links = "recent_links"
        case top_links = "top_links"
        case favourite_links = "favourite_links"
        case charData = "overall_url_chart"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        recent_links = try values.decodeIfPresent([LinkItem].self, forKey: .recent_links)
        top_links = try values.decodeIfPresent([LinkItem].self, forKey: .top_links)
        favourite_links = try values.decodeIfPresent([LinkItem].self, forKey: .favourite_links)
        charData = try values.decodeIfPresent([String:Int].self, forKey: .charData)
    }
}

struct HoriData: Decodable {
    let key: String
    let value: String
    let loco: String
    init(key: String, value: String, loco: String) {
        self.key = key
        self.value = value
        self.loco = loco
    }
}
