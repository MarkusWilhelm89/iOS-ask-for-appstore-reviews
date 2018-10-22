//
//  AppstoreReviewHandler.swift
//  Cocteles
//
//  Created by Markus Wilhelm on 21.10.18.
//  Copyright © 2018 Markus Wilhelm. All rights reserved.
//

import UIKit
import StoreKit

class AppstoreReviewHandler: NSObject {
    
    private let MINIMUM_APP_LAUNCHES_UNTIS_FIRST_REQUEST = 3
    private let REVIEW_SESSION_COUNT_KEY = "app_sessions_count_key"
    
    private let defaults = UserDefaults.standard
    
    override init() {
        super.init()
    }
    
    public func recordAppLaunch() {
        var appLaunches = defaults.integer(forKey: REVIEW_SESSION_COUNT_KEY)
        appLaunches += 1
        defaults.set(appLaunches, forKey: REVIEW_SESSION_COUNT_KEY)
        defaults.synchronize()
    }
    
    public func tryToGetAppstoreReview() {
        let appLaunches = defaults.integer(forKey: REVIEW_SESSION_COUNT_KEY)
        if  appLaunches >= MINIMUM_APP_LAUNCHES_UNTIS_FIRST_REQUEST {
            self.askForReview()
        }
    }
    
    private func askForReview() {
        if #available( iOS 10.3,*) {
            // Note that this is not shown every time you want it.
            // Apple handles it in their own way so that a user will see it max three times a year.
            SKStoreReviewController.requestReview()
        }
    }
}
