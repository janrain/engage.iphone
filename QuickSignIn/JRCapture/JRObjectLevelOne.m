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


#import "JRObjectLevelOne.h"

@implementation JRObjectLevelOne
@synthesize level;
@synthesize name;
@synthesize objectLevelTwo;

- (id)init
{
    if ((self = [super init]))
    {
    }
    return self;
}

+ (id)objectLevelOne
{
    return [[[JRObjectLevelOne alloc] init] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{
    JRObjectLevelOne *objectLevelOneCopy =
                [[JRObjectLevelOne allocWithZone:zone] init];

    objectLevelOneCopy.level = self.level;
    objectLevelOneCopy.name = self.name;
    objectLevelOneCopy.objectLevelTwo = self.objectLevelTwo;

    return objectLevelOneCopy;
}

+ (id)objectLevelOneObjectFromDictionary:(NSDictionary*)dictionary
{
    JRObjectLevelOne *objectLevelOne =
        [JRObjectLevelOne objectLevelOne];

    objectLevelOne.level = [dictionary objectForKey:@"level"];
    objectLevelOne.name = [dictionary objectForKey:@"name"];
    objectLevelOne.objectLevelTwo = [JRObjectLevelTwo objectLevelTwoObjectFromDictionary:(NSDictionary*)[dictionary objectForKey:@"objectLevelTwo"]];

    return objectLevelOne;
}

- (NSDictionary*)dictionaryFromObject
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:10];


    if (level)
        [dict setObject:level forKey:@"level"];

    if (name)
        [dict setObject:name forKey:@"name"];

    if (objectLevelTwo)
        [dict setObject:[objectLevelTwo dictionaryFromObject] forKey:@"objectLevelTwo"];

    return dict;
}

- (void)updateFromDictionary:(NSDictionary*)dictionary
{
    if ([dictionary objectForKey:@"level"])
        self.level = [dictionary objectForKey:@"level"];

    if ([dictionary objectForKey:@"name"])
        self.name = [dictionary objectForKey:@"name"];

    if ([dictionary objectForKey:@"objectLevelTwo"])
        self.objectLevelTwo = [JRObjectLevelTwo objectLevelTwoObjectFromDictionary:(NSDictionary*)[dictionary objectForKey:@"objectLevelTwo"]];
}

- (void)dealloc
{
    [level release];
    [name release];
    [objectLevelTwo release];

    [super dealloc];
}
@end
