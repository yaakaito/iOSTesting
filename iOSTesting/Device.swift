//
//  Driver.swift
//  iOSTesting
//
//  Created by Kazuma Ukyo on 2017/02/10.
//  Copyright © 2017年 Kazuma Ukyo. All rights reserved.
//

import Foundation

protocol Device {
    var name: String { get }
    func sound() -> String
}

class MyDevices {
    static var shared = MyDevices()
}
