//
//  CourseStore.m
//  TimeTable
//
//  Created by moeen ahmad on 5/15/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import "CourseStore.h"
#import "DataModel.h"
#import <NotificationCenter/NotificationCenter.h>

@implementation CourseStore

@synthesize checked, coursename, coursecolor;
@synthesize dueDate, shouldRemind, itemId;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init])) {
        self.coursename = [aDecoder decodeObjectForKey:@"CourseName"];
        self.coursecolor = [aDecoder decodeObjectForKey:@"CourseColor"];
       
       
        self.checked = [aDecoder decodeBoolForKey:@"Checked"];
        self.dueDate = [aDecoder decodeObjectForKey:@"DueDate"];
        self.shouldRemind = [aDecoder decodeBoolForKey:@"ShouldRemind"];
        self.itemId = [aDecoder decodeIntForKey:@"ItemID"];
    }
    return self;
}


///method to encode

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.coursename forKey:@"CourseName"];
    [aCoder encodeObject:self.coursecolor forKey:@"CourseColor"];
   
    [aCoder encodeBool:self.checked forKey:@"Checked"];
    [aCoder encodeObject:self.dueDate forKey:@"DueDate"];
    [aCoder encodeBool:self.shouldRemind forKey:@"ShouldRemind"];
    [aCoder encodeInt: (int) self.itemId forKey:@"ItemID"];
}




///method that records whether an item is checked

- (void)toggleChecked
{
    self.checked = !self.checked;
}


///We need to assign an id for each item.

- (id)init
{
    if (self = [super init]) {
        self.itemId = [DataModel nextChecklistItemId];
    }
    return self;
}



///We need to assign an id for each item so that we can easily identify.
- (UILocalNotification *)notificationForThisItem
{
    NSArray *allNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    for (UILocalNotification *notification in allNotifications) {
        NSNumber *number = [notification.userInfo objectForKey:@"ItemID"];
        if (number != nil && [number intValue] == self.itemId) {
            
            return notification;
        }
    }
    return nil;
}


///We schedule notification here for the selected item. If there is any existing notification for this item, we remove them so that only latest alarm time will be fired.

- (void)scheduleNotification
{
    
    UILocalNotification *existingNotification = [self notificationForThisItem];
    if (existingNotification != nil) {
        
        NSLog(@"Found an existing notification %@", existingNotification);
        
        [[UIApplication sharedApplication] cancelLocalNotification:[self notificationForThisItem]];
        
    }
    
    
    
    if (self.shouldRemind && [self.dueDate compare:[NSDate date]] != NSOrderedAscending) {
        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = self.dueDate;
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.alertBody = self.coursename;
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification.userInfo = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:(int) self.itemId] forKey:@"ItemID"];
        
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        
        NSLog(@"Scheduled notification %@ for itemId %d", localNotification, self.itemId);
    }
}




- (void)dealloc
{
    UILocalNotification *existingNotification = [self notificationForThisItem];
    if (existingNotification != nil) {
        //   NSLog(@"Removing existing notification %@", existingNotification);
        [[UIApplication sharedApplication] cancelLocalNotification:
         existingNotification];
    }
}





@end
