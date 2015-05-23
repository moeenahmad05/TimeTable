//
//  DataModel.h
//  Task List
//
//  Created by Kalai Chelvan on 9/9/12.
//  Copyright (c) 2012 Kalai Chelvan. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface DataModel : NSObject



/// We declare nextChecklistItemId method to assign an ID for each notification scheduled.

+ (int)nextChecklistItemId;


@end
