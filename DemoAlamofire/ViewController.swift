//
//  ViewController.swift
//  DemoAlamofire
//
//  Created by Hồng Chinh on 2/20/19.
//  Copyright © 2019 Hồng Chinh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet var tblJSON: UITableView!
    var arrRes = [[String:AnyObject]]() //Array of dictionary 

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON{ (responseData) -> Void in
            if ((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["contacts"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.tblJSON.reloadData()
                }
            }
        }
    }


}

