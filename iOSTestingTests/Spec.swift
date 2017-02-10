//
//  Spec.swift
//  iOSTesting
//
//  Created by Kazuma Ukyo on 2017/02/10.
//  Copyright © 2017年 Kazuma Ukyo. All rights reserved.
//

import Quick

class MockAPIClient: GodAPIClient {
    override func getAllShop(callback: (JSON) -> Void) {
        callback([
            "status": "ok",
            "shops": shops
        ])
    }
    
    override func getShop(id: Int, callback: (JSON) -> Void) {
        callback([
            "status": "ok",
            "shop": shops2[id - 1]
        ])
    }
    
    override func getItem(shopId: Int, callback: APICallback) {
        callback([
                "status": "ok",
                "items": items[shopId - 1]
                ])
        
    }
}

class Spec: QuickSpec {
    override func spec() {
        describe("ShopRepository") {
            context("fetch") {
                it("Shopが取得できる") {
                    let repository = ShopRepository()
                    repository.apiClient = MockAPIClient()
                    repository.fetch {
                        // assertions
                    }
                    XCTAssertEqual(repository.shops.count, 3)
                    let driveShop = repository.shops[0]
                    XCTAssertEqual(driveShop.name, "ドライブショップ")
                    XCTAssertEqual(driveShop.text, "仮面ライダードライブのシフトカーショップ")
                    XCTAssertEqual(driveShop.id, 1)
                    XCTAssertEqual(driveShop.items?.count, 3)
                }

            }
        }
    }
}
