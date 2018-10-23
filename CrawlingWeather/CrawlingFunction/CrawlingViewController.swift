//
//  CrawlingViewController.swift
//  CrawlingWeather
//
//  Created by sutie on 21/10/2018.
//  Copyright © 2018 sutie. All rights reserved.
//

import UIKit
import SwiftSoup
import Alamofire

class CrawlingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrapHTML()
    }
    
    func parseHTML(html: String) {
        
        do {
            let doc: Document = try SwiftSoup.parse(html)

            let link = try doc.getElementsByTag("div").filter {
                try $0.className() == "tiered-results tiered-results--exact" }.first!
            let presentationLink = try link.getElementsByTag("div").map {
                try $0.attr("role", "presentation") }.first!
            let articleLink: Element = try link.getElementsByTag("article").filter {
                try $0.className() == "results-card residential-card"
            }.first!
            
            
//            let linkSpan: String = try link.attr("span")
            let linkText: String = try articleLink.text() // "example""

            print("articleLink : \(articleLink)")
            print("linkText = \(linkText)")
            
        } catch Exception.Error(let type, let message) {
            print("[ERROR] type : \(type), \(message)")
        } catch {
            print("error")
        }
    }
    
    func scrapHTML() {
        let html = "https://www.realestate.com.au/buy/in-sydney,+nsw+2000%3b/list-1"
        Alamofire.request(html).responseString(completionHandler: { response in
            print("isSuccess : \(response.result.isSuccess)")
            if let html = response.result.value {
                self.parseHTML(html: html)
            }
        })
    }

    static func create() -> CrawlingViewController {
        let sb = UIStoryboard(name: "Crawling", bundle: nil)
        return sb.instantiateViewController(withIdentifier: "CrawlingViewController") as! CrawlingViewController
    }

}
