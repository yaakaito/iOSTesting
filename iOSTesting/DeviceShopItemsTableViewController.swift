//
//  DeviceShopItemsTableViewController.swift
//  iOSTesting
//
//  Created by Kazuma Ukyo on 2017/02/10.
//  Copyright © 2017年 Kazuma Ukyo. All rights reserved.
//

import UIKit

class DeviceShopItemsTableViewController: UITableViewController {

    var shopId: Int!
    var shop: [String: AnyObject]?
    var items: [[String: AnyObject]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        GodAPIClient.getShop(id: shopId, callback: { (JSON) in
            guard
                let status = JSON["status"],
                status as! String == "ok" else {
                    print("だめでした・・・")
                    return
            }
            
            guard
                let shop = JSON["shop"] else {
                    return
            }
            self.shop = shop as? [String: AnyObject]
            
        })
        
        GodAPIClient.getItem(shopId: self.shopId, callback: { (JSON) in
            guard
                let status = JSON["status"],
                status as! String == "ok" else {
                    print("だめでした・・・")
                    return
            }
            
            guard
                let items = JSON["items"] else {
                    return
            }
            self.items = items as? [[String: AnyObject]]
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        }
        return (self.items?.count)!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "　"
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.section == 0 {
            // Configure the cell...
            cell.textLabel?.text = self.shop?["text"] as? String
        }
        else {
            // Configure the cell...
            cell.textLabel?.text = self.items?[indexPath.row]["name"] as? String
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
