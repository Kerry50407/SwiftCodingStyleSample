//
//  String+Extension.swift
//  SwiftCodingStyleSample
//
//  Created by Kerry Dong on 2022/1/3.
//  Copyright © 2022 Kerry Dong. All rights reserved.
//

import Foundation

extension String {
    func base64Encoded() -> String? {
        return data(using: .utf8)?.base64EncodedString()
    }
    func base64Decoded() -> [UInt8]? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return [UInt8](data)
    }
}
