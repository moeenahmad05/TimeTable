//
//  CourseStore.h
//  TimeTable
//
//  Created by moeen ahmad on 5/15/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseStore : NSObject<NSCoding>

@property (nonatomic, copy) NSString *coursename;
@property (nonatomic,copy) NSData *coursecolor;
@property (nonatomic, assign) BOOL checked;

@property (nonatomic, copy) NSDate *dueDate;

@property (nonatomic, assign) BOOL shouldRemind;
@property (nonatomic, assign) int itemId;



///declare method to schedule local notification
- (void)scheduleNotification;




///declare method when user tap on an item to mark it as compelted
- (void)toggleChecked;


@end
