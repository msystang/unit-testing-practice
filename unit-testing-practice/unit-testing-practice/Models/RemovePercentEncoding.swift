//
//  RemovePercentEncoding.swift
//  unit-testing-practice
//
//  Created by Sunni Tang on 8/30/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

extension String {
    //refactor later to include error enum case
    func removePercentEncoding() -> String {
        let newString = self.removingPercentEncoding
        return newString ?? "No string"

    }
}
