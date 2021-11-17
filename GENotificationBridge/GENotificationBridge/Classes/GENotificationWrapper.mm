//
//  GENotificationWrapper.m
//  GENotificationBridge
//
//  Created by GoEun Jeong on 2021/11/15.
//

#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>
#import <GENotification/GENotification-Swift.h>
#import "GENotificationWrapper.h"


#pragma mark - String Helpers

static NSString * const NSStringFromCString(const char *string) {
    if (string != NULL) {
        return [NSString stringWithUTF8String:string];
    } else {
        return nil;
    }
}

static const char * const CStringFromNSString(NSString *string) {
    if (string != NULL) {
        return [string cStringUsingEncoding:NSUTF8StringEncoding];
    } else {
        return nil;
    }
}

#pragma mark - C interface

extern "C" {
    void __IOS_requestForNotification() {
        [[GENotification shared] requestForNotification];
    }
    
    void __IOS_sendNotificationI(const char* alertTitle, const char* alertBody, int afterSeconds) {
        NSString *_alertTitle = NSStringFromCString(alertTitle);
        NSString *_alertBody = NSStringFromCString(alertBody);
        [[GENotification shared] sendNotificationIWithAlertTitle:_alertTitle alertBody:_alertBody afterSecond:NSInteger(afterSeconds)];
    }

    void __IOS_sendNotificationD(const char* alertTitle, const char* alertBody, double afterSeconds) {
        NSString *_alertTitle = NSStringFromCString(alertTitle);
        NSString *_alertBody = NSStringFromCString(alertBody);
        [[GENotification shared] sendNotificationDWithAlertTitle:_alertTitle alertBody:_alertBody afterSecond:afterSeconds];
    }

    void __IOS_sendNotificationF(const char* alertTitle, const char* alertBody, float afterSeconds) {
        NSString *_alertTitle = NSStringFromCString(alertTitle);
        NSString *_alertBody = NSStringFromCString(alertBody);
        [[GENotification shared] sendNotificationFWithAlertTitle:_alertTitle alertBody:_alertBody afterSecond:afterSeconds];
    }
}
