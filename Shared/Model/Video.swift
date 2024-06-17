//
//  Video.swift
//  YAP (iOS)
//
//  Created by Joel Musita on 6/10/24.
//

import Foundation

struct Video: Identifiable, Decodable{
    let videoUrl: String
    var id: String {
        return NSUUID().uuidString
    }
}
