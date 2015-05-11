//
//  NSNotificationCenter+NotificationsOptions.h
//  Lesson4
//
//  Created by Vasily on 04.05.15.
//  Copyright (c) 2015 Vasily Filippov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSNotificationCenter (NotificationsOptions)

+ (void) set_Notif: (NSString *) name_Notif Selector: (SEL) name_Method Object: (UIViewController *) contorller;

+ (void) call_Notif: (NSString *) name_Notif Dictionary: (NSDictionary *) dictionary;

+ (void) delete_Notif;


@end
