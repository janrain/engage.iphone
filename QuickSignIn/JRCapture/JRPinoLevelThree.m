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


#import "JRPinoLevelThree.h"

@implementation JRPinoLevelThree
@synthesize pinoLevelThreeId;
@synthesize level;
@synthesize name;

- (id)init
{
    if ((self = [super init]))
    {
    }
    return self;
}

+ (id)pinoLevelThree
{
    return [[[JRPinoLevelThree alloc] init] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{
    JRPinoLevelThree *pinoLevelThreeCopy =
                [[JRPinoLevelThree allocWithZone:zone] init];

    pinoLevelThreeCopy.pinoLevelThreeId = self.pinoLevelThreeId;
    pinoLevelThreeCopy.level = self.level;
    pinoLevelThreeCopy.name = self.name;

    return pinoLevelThreeCopy;
}

+ (id)pinoLevelThreeObjectFromDictionary:(NSDictionary*)dictionary
{
    JRPinoLevelThree *pinoLevelThree =
        [JRPinoLevelThree pinoLevelThree];

    pinoLevelThree.pinoLevelThreeId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];
    pinoLevelThree.level = [dictionary objectForKey:@"level"];
    pinoLevelThree.name = [dictionary objectForKey:@"name"];

    return pinoLevelThree;
}

- (NSDictionary*)dictionaryFromObject
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:10];


    if (pinoLevelThreeId)
        [dict setObject:[NSNumber numberWithInt:pinoLevelThreeId] forKey:@"id"];

    if (level)
        [dict setObject:level forKey:@"level"];

    if (name)
        [dict setObject:name forKey:@"name"];

    return dict;
}

- (void)updateFromDictionary:(NSDictionary*)dictionary
{
    if ([dictionary objectForKey:@"pinoLevelThreeId"])
        self.pinoLevelThreeId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];

    if ([dictionary objectForKey:@"level"])
        self.level = [dictionary objectForKey:@"level"];

    if ([dictionary objectForKey:@"name"])
        self.name = [dictionary objectForKey:@"name"];
}

- (void)dealloc
{
    [level release];
    [name release];

    [super dealloc];
}
@end
