//
//  SubjectStore.m
//  TimeTable
//
//  Created by moeen ahmad on 5/15/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import "SubjectStore.h"

@implementation SubjectStore

///synthesize the declared properties

@synthesize text, checked;
@synthesize dueDate,endDate,priority,priorityToDisplay,ClassToDisplay;


///method to decode


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init])) {
        self.text = [aDecoder decodeObjectForKey:@"Text"];
        self.dueDate = [aDecoder decodeObjectForKey:@"DueDate"];
        self.endDate = [aDecoder decodeObjectForKey:@"EndDate"];
          self.priority = [aDecoder decodeObjectForKey:@"Priority"];
    self.priorityToDisplay = [aDecoder decodeObjectForKey:@"PriorityToDisplay"];
       
        self.ClassToDisplay = [aDecoder decodeObjectForKey:@"ClassToDisplay"];
        
        self.checked = [aDecoder decodeBoolForKey:@"Checked"];
        
    }
    return self;
}


///method to encode

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.text forKey:@"Text"];
   [aCoder encodeObject:self.dueDate forKey:@"DueDate"];
    [aCoder encodeObject:self.endDate forKey:@"EndDate"];
    
    [aCoder encodeObject:self.priority forKey:@"Priority"];
    [aCoder encodeObject:self.priorityToDisplay forKey:@"PriorityToDisplay"];
    
   
    [aCoder encodeObject:self.ClassToDisplay forKey:@"ClassToDisplay"];
    
    [aCoder encodeBool:self.checked forKey:@"Checked"];
    
}




///method that records whether an item is checked

- (void)toggleChecked
{
    self.checked = !self.checked;
}






@end
