//
//  MocUsernameValidator.swift
//  Example_01TestsFast
//
//  Created by Alexander Rubtsov on 02.08.2021.
//  Copyright © 2021 Aleksandr Sychev. All rights reserved.
//

import Foundation

struct MocUsernameValidator {
    func isValid(_ username: String) -> Bool {
        return username.count > 4
    }
}
