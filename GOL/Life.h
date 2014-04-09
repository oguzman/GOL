//
//  Life.h
//  GOL
//
//  Created by Omar Guzmán on 09/04/14.
//  Copyright (c) 2014 ievolutioned. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Life : NSObject
//properties
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) bool ** world;
//methods
- (void) tick: (id)sender;
- (void) makeShip;
- (void) makeRand;
- (void) reset;
- (bool **) world;
@end