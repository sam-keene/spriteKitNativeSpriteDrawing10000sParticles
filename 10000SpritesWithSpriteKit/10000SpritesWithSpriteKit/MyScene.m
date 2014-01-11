//
//  MyScene.m
//  10000SpritesWithSpriteKit
//
//  Created by Sam Keene on 1/11/14.
//  Copyright (c) 2014 Sam Keene. All rights reserved.
//

#import "MyScene.h"
@interface MyScene()
@property (nonatomic, strong) NSArray *sprites;
@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
    }
    return self;
}

- (void)setupLEDs
{
    self.backgroundColor = [SKColor blackColor];
    
    // create the particle texture
    SKTexture *ledTexture = [SKTexture textureWithImageNamed:@"whitePixel"];
	
    // cycle through and throw as many sprites into the node as you want
    for (int i = 0; i < 10000; i++) {
		UIColor *randColor = i & 1 ? [UIColor redColor] : [UIColor greenColor];
		SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:ledTexture];
        sprite.position = CGPointZero;
        sprite.colorBlendFactor = 1.;
        sprite.color = randColor;
        [self addChild:sprite];
    }
    
    self.sprites = [NSArray arrayWithArray:self.children];
}


-(void)update:(CFTimeInterval)currentTime {
    
    for (SKSpriteNode *sprite in self.sprites) {
        sprite.position = CGPointMake(arc4random_uniform(320), arc4random_uniform(568));
    }
}

@end
