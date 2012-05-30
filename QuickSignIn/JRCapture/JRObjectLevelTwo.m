/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 Copyright (c) 2012, Janrain, Inc.

 All rights reserved.

 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation and/or
   other materials provided with the distribution.
 * Neither the name of the Janrain, Inc. nor the names of its
   contributors may be used to endorse or promote products derived from this
   software without specific prior written permission.


 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


#import "JRObjectLevelTwo.h"

@implementation JRObjectLevelTwo
@synthesize level;
@synthesize name;
@synthesize objectLevelThree;

- (id)init
{
    if ((self = [super init]))
    {
    }
    return self;
}

+ (id)objectLevelTwo
{
    return [[[JRObjectLevelTwo alloc] init] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{
    JRObjectLevelTwo *objectLevelTwoCopy =
                [[JRObjectLevelTwo allocWithZone:zone] init];

    objectLevelTwoCopy.level = self.level;
    objectLevelTwoCopy.name = self.name;
    objectLevelTwoCopy.objectLevelThree = self.objectLevelThree;

    return objectLevelTwoCopy;
}

+ (id)objectLevelTwoObjectFromDictionary:(NSDictionary*)dictionary
{
    JRObjectLevelTwo *objectLevelTwo =
        [JRObjectLevelTwo objectLevelTwo];

    objectLevelTwo.level = [dictionary objectForKey:@"level"];
    objectLevelTwo.name = [dictionary objectForKey:@"name"];
    objectLevelTwo.objectLevelThree = [JRObjectLevelThree objectLevelThreeObjectFromDictionary:(NSDictionary*)[dictionary objectForKey:@"objectLevelThree"]];

    return objectLevelTwo;
}

- (NSDictionary*)dictionaryFromObject
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:10];


    if (level)
        [dict setObject:level forKey:@"level"];

    if (name)
        [dict setObject:name forKey:@"name"];

    if (objectLevelThree)
        [dict setObject:[objectLevelThree dictionaryFromObject] forKey:@"objectLevelThree"];

    return dict;
}

- (void)updateFromDictionary:(NSDictionary*)dictionary
{
    if ([dictionary objectForKey:@"level"])
        self.level = [dictionary objectForKey:@"level"];

    if ([dictionary objectForKey:@"name"])
        self.name = [dictionary objectForKey:@"name"];

    if ([dictionary objectForKey:@"objectLevelThree"])
        self.objectLevelThree = [JRObjectLevelThree objectLevelThreeObjectFromDictionary:(NSDictionary*)[dictionary objectForKey:@"objectLevelThree"]];
}

- (void)dealloc
{
    [level release];
    [name release];
    [objectLevelThree release];

    [super dealloc];
}
@end
