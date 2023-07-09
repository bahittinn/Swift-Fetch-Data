//
//  Model.swift
//  Fetch-Search
//
//  Created by Bahittin on 9.07.2023.
//

import Foundation

struct ToDo:Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
