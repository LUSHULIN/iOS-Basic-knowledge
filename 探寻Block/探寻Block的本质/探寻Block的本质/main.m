//
//  main.m
//  探寻Block的本质
//
//  Created by Jason on 2018/6/6.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

typedef void (^Block)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Block block;
        {
            Person *person = [[Person alloc] init];
            person.age = 28;
            
            __weak Person *weakPerson = person;
            block = ^{
                NSLog(@"block内部%d",weakPerson.age);
            };
        }
        NSLog(@"don");
    }
    return 0;
}
