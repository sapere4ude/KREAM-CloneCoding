//
//  Extensions.swift
//  CREAM
//
//  Created by kant on 2022/10/02.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
