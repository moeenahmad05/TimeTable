//
//  SubjectStore.h
//  TimeTable
//
//  Created by moeen ahmad on 5/15/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubjectStore : NSObject<NSCoding>
///declare propertis of the items we want to store

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) BOOL checked;
@property (nonatomic, copy) NSString *priority;
@property (nonatomic, copy) NSString *priorityToDisplay;

@property (nonatomic, copy) NSString *ClassToDisplay;
@property (nonatomic, copy) NSDate *dueDate;
@property (nonatomic, copy) NSDate *endDate;



///declare method to schedule local notification


///declare method when user tap on an item to mark it as compelted
- (void)toggleChecked;


@end
