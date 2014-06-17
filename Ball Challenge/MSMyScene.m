//
//  MSMyScene.m
//  Ball Challenge
//
//  Created by Miguel Serrano on 17/06/14.
//  Copyright (c) 2014 Miguel Serrano. All rights reserved.
//

#import "MSMyScene.h"

@implementation MSMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        //background
        self.backgroundColor = [SKColor whiteColor];
        
        //lower edge
        SKNode *sceneEdge = [[SKNode alloc] init];
        sceneEdge.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        sceneEdge.position = CGPointZero;
        [self addChild:sceneEdge];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        
        CGPoint location = [touch locationInNode:self];
        
        int random = arc4random_uniform(3);
        switch (random) {
            case 0:
                [self addSoccerBallAtLocation:location];
                break;
            case 1:
                [self addBeachBallAtLocation:location];
                break;
            case 2:
                [self add8BallAtLocation:location];
                break;
            default:
                break;
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

#pragma mark - Helper Methods

- (void)addSoccerBallAtLocation:(CGPoint)location {
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"SoccerBall"];
    sprite.position = location;
    
    sprite.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:25.0];
    sprite.physicsBody.angularDamping = 1.0;
    sprite.physicsBody.angularVelocity = 1.0;
    sprite.physicsBody.density = 1.0;
    sprite.physicsBody.friction = 1.0;
    sprite.physicsBody.linearDamping = 1.0;
    sprite.physicsBody.mass = 1.0;
    sprite.physicsBody.restitution = 1.0;
    
    [self addChild:sprite];
}

- (void)addBeachBallAtLocation:(CGPoint)location {
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"BeachBall"];
    sprite.position = location;
    
    sprite.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:50.0];
    sprite.physicsBody.angularDamping = 0.5;
    sprite.physicsBody.angularVelocity = 0.5;
    sprite.physicsBody.density = 0.5;
    sprite.physicsBody.friction = 0.5;
    sprite.physicsBody.linearDamping = 0.5;
    sprite.physicsBody.mass = 0.5;
    sprite.physicsBody.restitution = 0.5;
    
    [self addChild:sprite];
}

- (void)add8BallAtLocation:(CGPoint)location {
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"8Ball"];
    sprite.position = location;
    
    sprite.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:20.0];
    sprite.physicsBody.angularDamping = 0.0;
    sprite.physicsBody.angularVelocity = 0.0;
    sprite.physicsBody.density = 0.0;
    sprite.physicsBody.friction = 0.0;
    sprite.physicsBody.linearDamping = 0.0;
    sprite.physicsBody.mass = 0.0;
    sprite.physicsBody.restitution = 0.0;
    
    [self addChild:sprite];
}

@end