//
//  NSSet+RandomObject.m
//  AlDente GameCenter
//
//  Created by Guven Iscan on 3/1/13.
//
//

#import "NSSet+RandomObject.h"

@implementation NSSet (RandomObject)

-(id) randomObject
{
    //Generate a random index
    NSUInteger randomIndex = arc4random_uniform([self count]);
    
    //Enumerate n = randomIndex objects before returning the specified one
    //This will be more efficient than creating an array from set's objects
    //especially if randomIndex is small.
    NSUInteger __block currentIndex = 0;
    id __block selectedObj = nil;
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        //Save the object and stop enumeration
        if (randomIndex == currentIndex)
        {
            selectedObj = obj;
            *stop = YES;
        }
        currentIndex++;
    }];
    return selectedObj;
}

@end
