//
//  Space.m
//  GOL
//
//  Created by Omar Guzmán on 09/04/14.
//  Copyright (c) 2014 ievolutioned. All rights reserved.
//

#import "Space.h"

@implementation Space
@synthesize life;
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define squareSize 4.0f
#define gridW 120
#define gridH 80

-(id)initWithDimensions:(CGSize)dimensions
{
    if (self = [super init])
    {
        self.frame = CGRectMake(2.0f, 2.0f, (gridW * squareSize) + 1.0f, (gridH * squareSize) + 1.0f);
        self.backgroundColor = RGB(0, 254, 0);
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    if(life)
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        [self drawLife:context];
        
//        [RGB(250, 250, 210) setStroke];
        [RGB(255, 0, 255) setStroke];
        CGContextSetLineWidth(context, 1.0f);
        
        // Define line paths
        CGMutablePathRef verticalLine = CGPathCreateMutable();
        CGPathMoveToPoint(verticalLine, nil, 0.5f, 0.5f);
        CGPathAddLineToPoint(verticalLine, nil, 0.5f, rect.size.height+0.5f);
        
        CGMutablePathRef horizontalLine = CGPathCreateMutable();
        CGPathMoveToPoint(horizontalLine, nil, 0.5f, 0.5f);
        CGPathAddLineToPoint(horizontalLine, nil, rect.size.width+0.5f, 0.5f);
        
        CGContextSaveGState(context);
        for(int x = 0; x<= life.size.width+1; x++) {
            
            CGContextAddPath(context, verticalLine);
            CGContextTranslateCTM(context, squareSize, 0);
            CGContextDrawPath(context, kCGPathStroke);
        }
        CGContextRestoreGState(context);
        
        CGContextSaveGState(context);
        for(int y = 0; y<=life.size.height+1; y++) {
            
            CGContextAddPath(context, horizontalLine);
            CGContextTranslateCTM(context, 0, squareSize);
            CGContextDrawPath(context, kCGPathStroke);
        }
        CGContextRestoreGState(context);
        
        // Clean up paths
        CGPathRelease(verticalLine);
        CGPathRelease(horizontalLine);
    }
}

-(void)drawLife:(CGContextRef)context
{
    [RGB(56, 65, 48) setFill];
    
    bool **world = [life world];
    
    for(int y = 0; y< life.size.height; y++) {
        
        for (int x = 0; x < life.size.width; x++) {
            
            BOOL alive = world[y][x];
            
            // If the cell is alive fill it!
            if(alive) {
                
                CGContextFillRect(context, CGRectMake((x*squareSize)+0.5f, (y*squareSize)+0.5f, squareSize, squareSize));
            }
        }
    }
}

@end