//
//  Shop.swift
//  iOSTesting
//
//  Created by Kazuma Ukyo on 2017/02/10.
//  Copyright © 2017年 Kazuma Ukyo. All rights reserved.
//

import Foundation

class Item {
    var id: Int!
    var name: String!
}

class Shop {
    var id: Int!
    var name: String!
    var text: String!
    var items: [Item]?
}

class ShopRepository {
    
    var shops: [Shop] = []
    var apiClient: GodAPIClient = GodAPIClient()
    
    func fetch(callback: () -> Void) {
        
        self.apiClient.getAllShop { (JSON) in
            guard
                let shops = JSON["shops"] as? [[String: AnyObject]] else {
                    return
            }
            
            shops.forEach({ (dic) in
                let mShop = Shop()
                mShop.id = dic["id"] as! Int
                mShop.name = dic["name"] as! String
                
                apiClient.getShop(id: mShop.id, callback: { (JSON) in
                    
                    guard
                        let shop = JSON["shop"] as? [String: AnyObject] else {
                            return
                    }
                    mShop.text = shop["text"] as! String
                    
                })
                
                apiClient.getItem(shopId: mShop.id, callback: { (JSON) in
                    guard
                        let items = JSON["items"] as? [[String: AnyObject]] else {
                            return
                    }
                    
                    var ary: [Item] = []
                    items.forEach({ (dic) in
                        let mItem = Item()
                        mItem.id = dic["id"] as! Int
                        mItem.name = dic["name"] as! String
                        ary.append(mItem)
                    })
                    mShop.items = ary
                })
                
                self.shops.append(mShop)
            })
            
        }

    }
}
