//
//  GENotification.swift
//  GENotification
//
//  Created by GoEun Jeong on 2021/11/15.
//

#if os(iOS) || os(OSX)

import Foundation
import UserNotifications


@objc open class GENotification: NSObject {
    @objc public static let shared = GENotification()
    
    private override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
    
    @objc open func sendNotificationD(alertTitle: String, alertBody: String, afterSecond: Double) {
        let content = UNMutableNotificationContent()
        
        content.title = alertTitle
        content.body = alertBody
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: afterSecond, repeats: false)
        let request = UNNotificationRequest(identifier: "GENotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @objc open func sendNotificationF(alertTitle: String, alertBody: String, afterSecond: Float) {
        let content = UNMutableNotificationContent()
        
        content.title = alertTitle
        content.body = alertBody
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(afterSecond), repeats: false)
        let request = UNNotificationRequest(identifier: "GENotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @objc open func sendNotificationI(alertTitle: String, alertBody: String, afterSecond: Int) {
        let content = UNMutableNotificationContent()
        
        content.title = alertTitle
        content.body = alertBody
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(afterSecond), repeats: false)
        let request = UNNotificationRequest(identifier: "GENotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @objc open func requestForNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: { isAllowed, error in
            
        })
    }
}

@objc extension GENotification: UNUserNotificationCenterDelegate {
    @objc public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }

    @objc public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {

        // deep link처리 시 아래 url값 가지고 처리
//        let url = response.notification.request.content.userInfo

        completionHandler()
    }
}

#endif
