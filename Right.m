//
//  Right.m
//  NextEpsilon
//
//  Created by Erik Artymiuk on 2/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Right.h"
#import "Constants.h"

@implementation Right

//Adjust to change movement settings

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    //make background move
    bg.physicsBody.velocity = CGPointMake(-SPEED, 0);
    
    //do a background check
    [self schedule:@selector(backgroundCheck) interval:0.001];
    
    //get legs moving
    countRight = STEPHEIGHT;
    countLeft  = STEPHEIGHT;
    countRightRotate = STEPROTATE;
    countLeftRotate = STEPROTATE;
    initialPosRight = rLeg.position;
    initialPosLeft = lLeg.position;
    caseRight = 1;
    caseLeft = 3;
    
    [self schedule:@selector(moveRightLeg) interval:LEGSPEED];
    lLeg.position = CGPointMake(lLeg.position.x, lLeg.position.y+STEPHEIGHT);
    [self schedule:@selector(moveLeftLeg) interval:LEGSPEED];
    
    //get head rolling
    //[self schedule:@selector(bounceHead) interval:1];
    
    NSLog(@"%f", bg.position.x);
    NSLog(@"RightBegin");
}

-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    //stop background
    bg.physicsBody.velocity = CGPointMake(0, 0);
    
    //stop legs
    [self unschedule:@selector(moveRightLeg)];
    [self unschedule:@selector(moveLeftLeg)];
    
    //stop head
    //[self unschedule:@selector(bounceHead)];
    
    //return everything to original position
    rLeg.position = initialPosRight;
    lLeg.position = initialPosLeft;
    rLeg.rotation = 0;
    lLeg.rotation = 0;
    
    NSLog(@"RightEnded");
}

- (void)touchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    NSLog(@"Right Touch Cancelled");
}

- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    NSLog(@"Right Touch Moved");
}

- (void)moveRightLeg
{
    if (caseRight == 1)
    {
        rLeg.position = CGPointMake(rLeg.position.x, rLeg.position.y+2);
        countRight--;
        if (countRight == 0)
        {
            [self bounceBody];
            caseRight = 2;
            countRight = STEPHEIGHT;
        }
    }
    else if (caseRight == 2)
    {
        countRightRotate--;
        rLeg.rotation = rLeg.rotation - 2;
        if (countRightRotate == 0)
        {
            caseRight = 3;
            countRightRotate = STEPROTATE;
        }
    }
    else if (caseRight == 3)
    {
        countRight--;
        rLeg.position = CGPointMake(rLeg.position.x, rLeg.position.y-2);
        if (countRight == 0)
        {
            caseRight = 4;
            countRight = STEPHEIGHT;
        }
    }
    else
    {
        countRightRotate--;
        rLeg.rotation = rLeg.rotation + 2;
        if (countRightRotate == 0)
        {
            caseRight = 1;
            countRightRotate = STEPROTATE;
        }
    }
}

- (void)moveLeftLeg
{
    if (caseLeft == 1)
    {
        lLeg.position = CGPointMake(lLeg.position.x, lLeg.position.y+2);
        countLeft--;
        if (countLeft == 0)
        {
            caseLeft = 2;
            countLeft = STEPHEIGHT;
        }
    }
    else if (caseLeft == 2)
    {
        countLeftRotate--;
        lLeg.rotation = lLeg.rotation - 2;
        if (countLeftRotate == 0)
        {
            caseLeft = 3;
            countLeftRotate = STEPROTATE;
        }
    }
    else if (caseLeft == 3)
    {
        countLeft--;
        lLeg.position = CGPointMake(lLeg.position.x, lLeg.position.y-2);
        if (countLeft == 0)
        {
            caseLeft = 4;
            countLeft = STEPHEIGHT;
        }
    }
    else
    {
        countLeftRotate--;
        lLeg.rotation = lLeg.rotation + 2;
        if (countLeftRotate == 0)
        {
            caseLeft = 1;
            countLeftRotate = STEPROTATE;
        }
    }
}

- (void) bounceBody
{
    [head.physicsBody applyForce:CGPointMake(0, 1000)];
    [belly.physicsBody applyForce:CGPointMake(0, 500)];
}

- (void) backgroundCheck
{
    
    if (bg.position.x < -2048)
    {
        [bg setPosition:CGPointMake(-568, bg.position.y)];
    }
}
@end
