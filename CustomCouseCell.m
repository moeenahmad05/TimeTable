//
//  CustomCouseCell.m
//  TimeTable
//
//  Created by moeen ahmad on 5/15/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import "CustomCouseCell.h"

@implementation CustomCouseCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self sendSubviewToBack:self.contentView];
    
    for (UIView *subview in self.subviews) {
        
        for (UIView *subview2 in subview.subviews) {
            
            if ([NSStringFromClass([subview2 class]) isEqualToString:@"UITableViewCellDeleteConfirmationView"]) { // move delete confirmation view
                
                [subview bringSubviewToFront:subview2];
                
            }
        }
    }
}


@end
