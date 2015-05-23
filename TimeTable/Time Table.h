//
//  Time Table.h
//  TimeTable
//
//  Created by moeen ahmad on 5/13/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ManageTimetable.h"
#import "AddSubjectItem.h"



@interface Time_Table : UIViewController<ManageTimeTableDelegate,AddItemViewControllerDelegate>



@property (weak, nonatomic) IBOutlet UILabel *datelabel;



// days outlet
@property (weak, nonatomic) IBOutlet UILabel *sun;
@property (weak, nonatomic) IBOutlet UILabel *mon;
@property (weak, nonatomic) IBOutlet UILabel *tue;
@property (weak, nonatomic) IBOutlet UILabel *wed;
@property (weak, nonatomic) IBOutlet UILabel *thu;
@property (weak, nonatomic) IBOutlet UILabel *fri;
@property (weak, nonatomic) IBOutlet UILabel *sat;

// classes outlet

@property (weak, nonatomic) IBOutlet UILabel *c1;

@property (weak, nonatomic) IBOutlet UILabel *c2;

@property (weak, nonatomic) IBOutlet UILabel *c3;
@property (weak, nonatomic) IBOutlet UILabel *c4;
@property (weak, nonatomic) IBOutlet UILabel *c5;
@property (weak, nonatomic) IBOutlet UILabel *c6;
@property (weak, nonatomic) IBOutlet UILabel *c7;
@property (weak, nonatomic) IBOutlet UILabel *c8;

//Label outlet

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *s1to8;

@property (weak, nonatomic) IBOutlet UILabel *s1;
@property (weak, nonatomic) IBOutlet UILabel *s2;
@property (weak, nonatomic) IBOutlet UILabel *s3;
@property (weak, nonatomic) IBOutlet UILabel *s4;
@property (weak, nonatomic) IBOutlet UILabel *s5;
@property (weak, nonatomic) IBOutlet UILabel *s6;
@property (weak, nonatomic) IBOutlet UILabel *s7;
@property (weak, nonatomic) IBOutlet UILabel *s8;



@property (weak, nonatomic) IBOutlet UILabel *m1;
@property (weak, nonatomic) IBOutlet UILabel *m2;
@property (weak, nonatomic) IBOutlet UILabel *m3;
@property (weak, nonatomic) IBOutlet UILabel *m4;
@property (weak, nonatomic) IBOutlet UILabel *m5;
@property (weak, nonatomic) IBOutlet UILabel *m6;
@property (weak, nonatomic) IBOutlet UILabel *m7;
@property (weak, nonatomic) IBOutlet UILabel *m8;


@property (weak, nonatomic) IBOutlet UILabel *t1;
@property (weak, nonatomic) IBOutlet UILabel *t2;
@property (weak, nonatomic) IBOutlet UILabel *t3;
@property (weak, nonatomic) IBOutlet UILabel *t4;
@property (weak, nonatomic) IBOutlet UILabel *t5;
@property (weak, nonatomic) IBOutlet UILabel *t6;
@property (weak, nonatomic) IBOutlet UILabel *t7;
@property (weak, nonatomic) IBOutlet UILabel *t8;

@property (weak, nonatomic) IBOutlet UILabel *w1;
@property (weak, nonatomic) IBOutlet UILabel *w2;
@property (weak, nonatomic) IBOutlet UILabel *w3;
@property (weak, nonatomic) IBOutlet UILabel *w4;
@property (weak, nonatomic) IBOutlet UILabel *w5;
@property (weak, nonatomic) IBOutlet UILabel *w6;
@property (weak, nonatomic) IBOutlet UILabel *w7;
@property (weak, nonatomic) IBOutlet UILabel *w8;



@property (weak, nonatomic) IBOutlet UILabel *th1;
@property (weak, nonatomic) IBOutlet UILabel *th2;
@property (weak, nonatomic) IBOutlet UILabel *th3;
@property (weak, nonatomic) IBOutlet UILabel *th4;
@property (weak, nonatomic) IBOutlet UILabel *th5;
@property (weak, nonatomic) IBOutlet UILabel *th6;
@property (weak, nonatomic) IBOutlet UILabel *th7;
@property (weak, nonatomic) IBOutlet UILabel *th8;


@property (weak, nonatomic) IBOutlet UILabel *f1;
@property (weak, nonatomic) IBOutlet UILabel *f2;
@property (weak, nonatomic) IBOutlet UILabel *f3;
@property (weak, nonatomic) IBOutlet UILabel *f4;
@property (weak, nonatomic) IBOutlet UILabel *f5;
@property (weak, nonatomic) IBOutlet UILabel *f6;
@property (weak, nonatomic) IBOutlet UILabel *f7;
@property (weak, nonatomic) IBOutlet UILabel *f8;


@property (weak, nonatomic) IBOutlet UILabel *st1;
@property (weak, nonatomic) IBOutlet UILabel *st2;
@property (weak, nonatomic) IBOutlet UILabel *st3;
@property (weak, nonatomic) IBOutlet UILabel *st4;
@property (weak, nonatomic) IBOutlet UILabel *st5;
@property (weak, nonatomic) IBOutlet UILabel *st6;
@property (weak, nonatomic) IBOutlet UILabel *st7;
@property (weak, nonatomic) IBOutlet UILabel *st8;

- (IBAction)Actionbutton:(id)sender;

- (IBAction)b1:(id)sender;
- (IBAction)b2:(id)sender;
- (IBAction)b3:(id)sender;
- (IBAction)b4:(id)sender;
- (IBAction)b5:(id)sender;
- (IBAction)b6:(id)sender;
- (IBAction)b7:(id)sender;
- (IBAction)b8:(id)sender;
- (IBAction)b9:(id)sender;
- (IBAction)b10:(id)sender;
- (IBAction)b11:(id)sender;
- (IBAction)b12:(id)sender;
- (IBAction)b13:(id)sender;
- (IBAction)b14:(id)sender;
- (IBAction)b15:(id)sender;
- (IBAction)b16:(id)sender;
- (IBAction)b17:(id)sender;
- (IBAction)b18:(id)sender;
- (IBAction)b19:(id)sender;
- (IBAction)b20:(id)sender;
- (IBAction)b21:(id)sender;
- (IBAction)b22:(id)sender;
- (IBAction)b23:(id)sender;
- (IBAction)b24:(id)sender;
- (IBAction)b25:(id)sender;
- (IBAction)b26:(id)sender;
- (IBAction)b27:(id)sender;
- (IBAction)b28:(id)sender;
- (IBAction)b29:(id)sender;
- (IBAction)b30:(id)sender;
- (IBAction)b31:(id)sender;
- (IBAction)b32:(id)sender;
- (IBAction)b33:(id)sender;
- (IBAction)b34:(id)sender;
- (IBAction)b35:(id)sender;
- (IBAction)b36:(id)sender;
- (IBAction)b37:(id)sender;
- (IBAction)b38:(id)sender;
- (IBAction)b39:(id)sender;
- (IBAction)b40:(id)sender;
- (IBAction)b41:(id)sender;
- (IBAction)b42:(id)sender;
- (IBAction)b43:(id)sender;
- (IBAction)b44:(id)sender;
- (IBAction)b45:(id)sender;
- (IBAction)b46:(id)sender;
- (IBAction)b47:(id)sender;
- (IBAction)b48:(id)sender;
- (IBAction)b49:(id)sender;
- (IBAction)b50:(id)sender;
- (IBAction)b51:(id)sender;
- (IBAction)b52:(id)sender;
- (IBAction)b53:(id)sender;
- (IBAction)b54:(id)sender;


@end
