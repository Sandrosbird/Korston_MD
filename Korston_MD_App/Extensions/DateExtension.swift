//
//  DateExtension.swift
//  Korston_MD_App
//
//  Created by Emil Mescheryakov on 25.12.2020.
//

import UIKit

extension Date {
    var millisecondsSince1970: Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
}
