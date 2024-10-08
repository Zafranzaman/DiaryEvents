//
//  DiaryEventsModel.swift
//  DiaryEvents
//
//  Created by Zafran Mac on 08/10/2023.
//

import Foundation
struct DairyInfomation: Codable
{
    var did: Int
    var Title: String
    var Venue: String
    var Events: String
    var Date: String
    var Time: String
    var Description: String
   
}
struct ChainTitle: Codable
{
    //var ChainEventid: Int
    var ChainTitle: String
    //var did: Int
    
}
struct EventInfomation: Codable
{
    var did: Int
    var Title: String
    var Venue: String
    var Events: String
    var Date: String
    var Time: String
    var Description: String
    var isChecked: Bool
}
struct AddChainEvent: Codable
{
    var did: Int
    var ChainTitle:String
}
struct gettest: Codable
{
    var tid: Int
    var Name:String
    var Date:String
}
struct gettest1: Codable
{
    var tid: Int
    var Name:String
    var Time:String
}
struct Addform: Codable
{
    var tid: Int
    var Name:String
    var Date:String
    var Event:String
}
struct Addform1: Codable
{
    var tid: Int
    var Name:String
    var Time:String
    var description:String
}
struct tripImages {
    var id: Int
    var tripid: Int
    var image: Data
}
