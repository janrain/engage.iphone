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


#import "JROnipLevelOne.h"

@implementation JROnipLevelOne
@synthesize onipLevelOneId;
@synthesize level;
@synthesize name;
@synthesize onipLevelTwo;

- (id)init
{
    if ((self = [super init]))
    {
    }
    return self;
}

+ (id)onipLevelOne
{
    return [[[JROnipLevelOne alloc] init] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{
    JROnipLevelOne *onipLevelOneCopy =
                [[JROnipLevelOne allocWithZone:zone] init];

    onipLevelOneCopy.onipLevelOneId = self.onipLevelOneId;
    onipLevelOneCopy.level = self.level;
    onipLevelOneCopy.name = self.name;
    onipLevelOneCopy.onipLevelTwo = self.onipLevelTwo;

    return onipLevelOneCopy;
}

+ (id)onipLevelOneObjectFromDictionary:(NSDictionary*)dictionary
{
    JROnipLevelOne *onipLevelOne =
        [JROnipLevelOne onipLevelOne];

    onipLevelOne.onipLevelOneId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];
    onipLevelOne.level = [dictionary objectForKey:@"level"];
    onipLevelOne.name = [dictionary objectForKey:@"name"];
    onipLevelOne.onipLevelTwo = [JROnipLevelTwo onipLevelTwoObjectFromDictionary:(NSDictionary*)[dictionary objectForKey:@"onipLevelTwo"]];

    return onipLevelOne;
}

- (NSDictionary*)dictionaryFromObject
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:10];


    if (onipLevelOneId)
        [dict setObject:[NSNumber numberWithInt:onipLevelOneId] forKey:@"id"];

    if (level)
        [dict setObject:level forKey:@"level"];

    if (name)
        [dict setObject:name forKey:@"name"];

    if (onipLevelTwo)
        [dict setObject:[onipLevelTwo dictionaryFromObject] forKey:@"onipLevelTwo"];

    return dict;
}

- (void)updateFromDictionary:(NSDictionary*)dictionary
{
    if ([dictionary objectForKey:@"onipLevelOneId"])
        self.onipLevelOneId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];

    if ([dictionary objectForKey:@"level"])
        self.level = [dictionary objectForKey:@"level"];

    if ([dictionary objectForKey:@"name"])
        self.name = [dictionary objectForKey:@"name"];

    if ([dictionary objectForKey:@"onipLevelTwo"])
        self.onipLevelTwo = [JROnipLevelTwo onipLevelTwoObjectFromDictionary:(NSDictionary*)[dictionary objectForKey:@"onipLevelTwo"]];
}

- (void)dealloc
{
    [level release];
    [name release];
    [onipLevelTwo release];

    [super dealloc];
}
@end
