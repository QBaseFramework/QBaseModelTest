//
//  QBaseModelTestTests.m
//  QBaseModelTestTests
//
//  Created by andy on 10/11/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QBaseTestModel.h"

@interface QBaseModelTestTests : XCTestCase
{
    QBaseTestModel *_model;
}
@end

@implementation QBaseModelTestTests
- (void)setUp
{
    [super setUp];
    
    NSLog(@"测试开始");
    
    
    NSDictionary *params = @{
                             @"qbase_id": @(1),
                             @"name"    : @"andyJin",
                             @"age"     : @(25)
                             };
    _model = [[QBaseTestModel alloc] initWithDictionary:params error:nil];
}

- (void)tearDown
{
    [super tearDown];
    
    NSLog(@"测试结束");
}

/**
 *  创建表测试
 */
- (void)testCreateTable
{
    BOOL res = [_model createTable];
    NSLog(@"%d", res);
}

/**
 *  删除表测试
 */
- (void)testDropTable
{
    BOOL res = [_model dropTable];
    NSLog(@"%d", res);
}

/**
 *  插入数据测试
 */
- (void)testInsertTable
{
    BOOL res = [_model insertTable];
    NSLog(@"%d", res);
}

/**
 *  更新数据测试
 */
- (void)testUpdate
{
    _model.age = 1000;
    [_model updateTable];
}

/**
 *  检查测试
 */
- (void)testSelect
{
    NSArray *arr = [_model selectByConditions:nil
                                         args:nil
                                   pageNumber:1
                                     pageSize:2
                                        order:nil];
    NSLog(@"%@", arr);
    
    arr = [_model selectFromTable];
    NSLog(@"%@", arr);
}

@end
