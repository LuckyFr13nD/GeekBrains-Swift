//
//  Enums.swift
//  lesson5_dz5
//
//  Created by Владимир Глоба on 07.12.2021.
//

import Foundation

// MARK: - Enums
enum Engine: String {
    case on = "Заведен"
    case off = "Заглушен"
}

enum Windows: String {
    case opened = "Открыты"
    case closed = "Закрыты"
}

enum Trunk {
    case load (with: Int)
    case unload (with: Int)
}

enum Power {
    case increase (with: Int)
    case decrease (with: Int)
}

enum Trailer{
    case attached
    case unattached
}
