//
//  ViewController.h
//  GOL
//
//  Created by Omar Guzmán on 09/04/14.
//  Copyright (c) 2014 ievolutioned. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Space.h"
#import "Life.h"

@interface ViewController : UIViewController
@property (nonatomic, readonly) Space * space;
@property (nonatomic, strong) Life * life;
@property (nonatomic, assign) int generation;
@property (nonatomic, strong) NSTimer * ticker;
@end