//
//  Life.m
//  GOL
//
//  Created by Omar Guzmán on 09/04/14.
//  Copyright (c) 2014 ievolutioned. All rights reserved.
//

#import "Life.h"

@implementation Life
@synthesize world, size;

- (id) init
{
    if(self = [super init])
    {
        size = CGSizeMake(120, 80);
        world = [self createArray];
        for (int y = 0; y < size.height; y++)
        {
            for (int x = 0; x < size.width; x ++)
            {
                world[y][x] = arc4random_uniform(200) < 10;
            }
        }
    }
    return self;
}

-(void)reset
{
    for (int y = 0; y < size.height; y ++)
    {
        for (int x = 0; x < size.width; x ++)
        {
            world[y][x] = arc4random_uniform(200) < 8;
        }
    }
}

-(void)makeShip
{
    for (int y = 0; y < size.height; y ++)
    {
        for (int x = 0; x < size.width; x ++)
        {
            world[y][x] = false;
        }
    }
    
    int rand = arc4random_uniform(100);
    
    if(arc4random_uniform(2) < 1)
    {
        world[1][2+rand] = true;
        world[2][2+rand] = true;
        world[3][2+rand] = true;
        world[3][1+rand] = true;
        world[2][0+rand] = true;
    }
    else
    {
        world[1][1+rand] = true;
        world[1][4+rand] = true;
        world[2][5+rand] = true;
        world[3][5+rand] = true;
        world[4][2+rand] = true;
        world[4][3+rand] = true;
        world[4][4+rand] = true;
        world[4][5+rand] = true;

    }
}

- (void)makeRand
{
    
    for(int y=0; y < size.height; y++) {
        
        for(int x=0; x < size.width; x++) {
            
            world[y][x] = false;
        }
    }
    
    world[40][41] = true;
    world[40][42] = true;
    world[40][43] = true;
    world[40][44] = true;
    world[40][45] = true;
    world[40][46] = true;
    world[40][47] = true;
    world[40][48] = true;
    world[40][50] = true;
    world[40][51] = true;
    world[40][52] = true;
    world[40][53] = true;
    world[40][54] = true;
    world[40][58] = true;
    world[40][59] = true;
    world[40][60] = true;
    world[40][67] = true;
    world[40][68] = true;
    world[40][69] = true;
    world[40][70] = true;
    world[40][71] = true;
    world[40][72] = true;
    world[40][73] = true;
    world[40][75] = true;
    world[40][76] = true;
    world[40][77] = true;
    world[40][78] = true;
    world[40][79] = true;
}

- (void)tick:(id)sender
{
    bool ** tempWorld = [self createArray];
    
    for(int y = 0; y < size.height; y++)
    {
        for(int x = 0; x < size.width; x++)
        {
            free((bool*)tempWorld[y][x]);
            int n = 0;
            for (int y1 = y - 1; y1 <= y + 1; y1++)
            {
                for (int x1 = x - 1; x1 <= x + 1; x1++)
                {
                    if (world[(y1 + (int)size.height) % (int)size.height][(x1 + (int)size.width) % (int)size.width])
                    {
                        n++;
                    }
                }
            }
            if(world[y][x])
            {
                n--;
            }
            tempWorld[y][x] = (n == 3 || (n == 2 && world[y][x]));
        }
    }
    free(world);
    world = tempWorld;
}

- (bool **) world
{
    return world;
}

- (NSString *) description {
    
    NSMutableString *gridString = [NSMutableString stringWithString: @"\n"];
    
    for(int y = 0; y < size.height; y++) {
        
        for (int x = 0; x < size.width; x++) {
            
            BOOL alive = world[y][x];
            
            [gridString appendString: alive ? @"+" : @"-"];
        }
        
        [gridString appendString: @"\n"];
    }
    return gridString;
}


- (bool **) createArray {
    
    bool **array;
    
    if (( array = ( bool** )malloc( (size.height+1)*sizeof( bool* ))) == NULL ) {
        
        assert(@"Error!");
    }
    
    for ( int y = 0; y < size.height; y++ ) {
        
        if (( array[y] = ( bool* )malloc( size.width+1 )) == NULL ) {
            
            assert(@"another error");
        }
        // Init it otherwise we'll access some dodgy memory!
        for(int x = 0; x < size.width; x++) {
            
            array[y][x] = false;
        }
    }
    
    return array;
}
@end