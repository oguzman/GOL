//
//  Space.h
//  GOL
//
//  Created by Omar Guzmán on 09/04/14.
//  Copyright (c) 2014 ievolutioned. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Life.h"

@interface Space : UIView
// properties
@property (nonatomic, strong) Life * life;
// methods
- (id) initWithDimensions: (CGSize) dimensions;
- (void) drawLife: (CGContextRef) context;
@end