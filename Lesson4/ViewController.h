//
//  ViewController.h
//  Lesson4
//
//  Created by Vasily on 12.04.15.
//  Copyright (c) 2015 Vasily Filippov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MakeArrayas.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MakeArraysDelegate>

@property (nonatomic, strong) NSMutableArray * arrayM;
@property (nonatomic, assign) BOOL isFirstArray;

@end