//
//  GodAPIClient.swift
//  iOSTesting
//
//  Created by Kazuma Ukyo on 2017/02/10.
//  Copyright © 2017年 Kazuma Ukyo. All rights reserved.
//

import UIKit

typealias JSON = [String: Any]
typealias APICallback = (_ response: JSON) -> Void

class GodAPIClient {
    
    func getAllShop(callback: APICallback) {
        callback([
            "status": "ok",
            "shops": shops
        ])
    }

    func getShop(id: Int, callback: APICallback) {
        let r = arc4random_uniform(10)
        if r != 0  && 1 <= id && id <= 3 {
            callback([
                "status": "ok",
                "shop": shops2[id - 1]
            ])
        }
        else {
            callback([
                "status": "ng"
            ])
        }
    }
    
    func getItem(shopId: Int, callback: APICallback) {
        let r = arc4random_uniform(10)
        if r != 0  && 1 <= shopId && shopId <= 3 {
            callback([
                "status": "ok",
                "items": items[shopId - 1]
                ])
        }
        else {
            callback([
                "status": "ng"
                ])
        }

    }
}


// FIXTURE
let shops = [
    [
        "id": 1,
        "name": "ドライブショップ"
    ],
    [
        "id": 2,
        "name": "ゴーストショップ"
    ],
    [
        "id": 3,
        "name": "エグゼイドショップ"
    ]
]

let shops2 = [
    [
        "id": 1,
        "name": "ドライブショップ",
        "text": "仮面ライダードライブのシフトカーショップ"
    ],
    [
        "id": 2,
        "name": "ゴーストショップ",
        "text": "仮面ライダーゴーストの眼魂ショップ"
    ],
    [
        "id": 3,
        "name": "エグゼイドショップ",
        "text": "仮面ライダーエクゼイドのライダーガシャットショップ"
    ]
]

let items = [
    [
        ["id": 101, "name": "シフトスピード"],
        ["id": 102, "name": "シフトワイルド"],
        ["id": 103, "name": "シフトテクニック"],
    ],
    [
        ["id": 201, "name": "ムサシゴーストアイコン"],
        ["id": 202, "name": "エジソンゴーストアイコン"],
        ["id": 203, "name": "ロビンゴーストアイコン"],
    ],
    [
        ["id": 301, "name": "マイティアクションX"],
        ["id": 302, "name": "タドルクエスト"],
        ["id": 303, "name": "バンバンシューティング"],
        ["id": 304, "name": "爆走バイク"]
    ]
]
