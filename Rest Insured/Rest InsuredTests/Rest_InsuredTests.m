//
//  Rest_InsuredTests.m
//  Rest InsuredTests
//
//  Created by Brandon Little on 5/15/17.
//  Copyright © 2017 Brandon Little. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Rest_InsuredTests : XCTestCase

@end

@implementation Rest_InsuredTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUserSignUpWithFullName {
    
    NSString *urlString = [NSString stringWithFormat:@"https://rest-insured-staging.herokuapp.com/ext/doctors?lat=%f&lon=%f&range=10&insurance=%@&limit=5", 47.6224101, -122.3425608, @"IHC Group"];
    
    NSURL *databaseURL = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    [[session dataTaskWithURL:databaseURL
            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
                NSArray *rootObject = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:NSJSONReadingMutableContainers
                                                                        error:nil];
                XCTAssert([rootObject isKindOfClass:[NSArray class]]);
                XCTAssertTrue(response, @"Response is false");
                XCTAssertNil(error.localizedDescription,@"Error is nil");
                
            }] resume];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
