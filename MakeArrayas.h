//
//  MakeArrayas.h
//  Lesson4
//
//  Created by Vasily on 14.04.15.
//  Copyright (c) 2015 Vasily Filippov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MakeArraysDelegate;

@interface MakeArrayas : NSObject

@property (nonatomic, strong) NSMutableArray * arrayM;

- (void) makeFirstArray;
- (void) makeAnotherArray;

@property (weak, nonatomic) id <MakeArraysDelegate> delegate;

@end

@protocol MakeArraysDelegate <NSObject>

@required

- (void) makeArraysFirstArrayReady : (MakeArrayas *) makeArrays FirstArray: (NSMutableArray *) firstArray;
- (void) makeArraysSecondArrayReady : (MakeArrayas *) makeArrays SecondArray: (NSMutableArray *) secondArray;


@end