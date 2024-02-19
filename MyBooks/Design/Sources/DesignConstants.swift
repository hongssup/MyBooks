//
//  DesignConstants.swift
//  MyBooks
//
//  Created by hongssup on 2/18/24.
//

import SwiftUI

enum ButtonType {
    case filled
    case outline
}

extension ButtonType {
    var backgroundColor: Color {
        switch self {
        case .filled:
            Color(.orange500)
        case .outline:
            .white
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .filled:
            .white
        case .outline:
            Color(.orange500)
        }
    }
    
    var disabledBackgroundColor: Color {
        switch self {
        case .filled:
            Color(.gray400)
        case .outline:
            .white
        }
    }
    
    var disabledForegroundColor: Color {
        switch self {
        case .filled:
            .white
        case .outline:
            Color(.gray400)
        }
    }
    
    var pressedBackgroundColor: Color {
        switch self {
        case .filled:
            Color(.orange600)
        case .outline:
            Color(.orange100)
        }
    }
}
