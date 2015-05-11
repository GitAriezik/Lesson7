//
//  NSNotificationCenter+NotificationsOptions.m
//  Lesson4
//
//  Created by Vasily on 04.05.15.
//  Copyright (c) 2015 Vasily Filippov. All rights reserved.
//

#import "NSNotificationCenter+NotificationsOptions.h"

@implementation NSNotificationCenter (NotificationsOptions)

+ (void) set_Notif: (NSString *) name_Notif Selector: (SEL) name_Method Object: (UIViewController *) contorller {
    
    [[NSNotificationCenter defaultCenter] addObserver:contorller selector:name_Method name:name_Notif object:nil];

}

+ (void) call_Notif:(NSString *)name_Notif Dictionary:(NSDictionary *)dictionary {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:name_Notif object:nil userInfo:dictionary];

}

+ (void) delete_Notif {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
        
}

@end
