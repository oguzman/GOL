//
//  ViewController.m
//  GOL
//
//  Created by Omar Guzmán on 09/04/14.
//  Copyright (c) 2014 ievolutioned. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize life, space, ticker, generation;

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define squareSize 4.0f
#define gridW 120
#define gridH 80

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ticker = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
    
    [UIApplication sharedApplication].statusBarHidden = YES;
    self.view.backgroundColor = RGB(254, 0, 0);
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    float temp = floorf(screenSize.height / squareSize);
    screenSize.height = floorf(screenSize.width / squareSize);
    screenSize.width =  temp;
    
    CGSize dimensions = screenSize;
    
    space = [[Space alloc] initWithDimensions:dimensions];
    
    CGRect frame = space.frame;
    frame.origin.y = floorf(([UIScreen mainScreen].bounds.size.width - frame.size.height) / 2.0f);
    frame.origin.x = floorf(([UIScreen mainScreen].bounds.size.height - frame.size.width) / 2.0f);
    space.frame = frame;
    
    [self.view addSubview: space];
    
    [life makeRand];
}

-(void)viewDidAppear:(BOOL)animated
{
    life = [[Life alloc] init];
    space.life = life;
}

- (void) tick: (NSTimer *) timer
{
    generation ++;
    [life tick:timer];
    [space setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
