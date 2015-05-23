
#import "ChecklistItem.h"

#import <UIKit/UIKit.h>
@implementation ChecklistItem

///synthesize the declared properties

@synthesize text, checked, notes,emailid,website;



///method to decode


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init])) {
        self.text = [aDecoder decodeObjectForKey:@"Text"];
        self.notes = [aDecoder decodeObjectForKey:@"Notes"];
          self.emailid = [aDecoder decodeObjectForKey:@"Emailid"];
          self.website = [aDecoder decodeObjectForKey:@"Website"];
      
        self.checked = [aDecoder decodeBoolForKey:@"Checked"];
   
    }
    return self;
}


///method to encode

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.text forKey:@"Text"];
    [aCoder encodeObject:self.notes forKey:@"Notes"];
     [aCoder encodeObject:self.emailid forKey:@"Emailid"];
     [aCoder encodeObject:self.website forKey:@"Website"];
    
    [aCoder encodeBool:self.checked forKey:@"Checked"];

}




///method that records whether an item is checked

- (void)toggleChecked
{
    self.checked = !self.checked;
}











@end
