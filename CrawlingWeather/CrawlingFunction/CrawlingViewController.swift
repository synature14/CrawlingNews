//
//  CrawlingViewController.swift
//  CrawlingWeather
//
//  Created by sutie on 21/10/2018.
//  Copyright © 2018 sutie. All rights reserved.
//

import UIKit
import SwiftSoup

class CrawlingViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    static func create() -> CrawlingViewController {
        let sb = UIStoryboard(name: "Crawling", bundle: nil)
        return sb.instantiateViewController(withIdentifier: "CrawlingViewController") as! CrawlingViewController
    }

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
