//
//  ViewController.m
//  QQConact
//
//  Created by Geek on 16/5/19.
//  Copyright © 2016年 Geek. All rights reserved.
//

#import "ViewController.h"
#import "FriendGroup.h"

@interface ViewController ()
    @property (nonatomic,strong) NSArray *groups;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark 懒加载
-(NSArray *)groups{
    if(_groups == nil){
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
        NSLog(@"%d",dictArray.count);
        NSMutableArray *gourpArray = [NSMutableArray array];
        for(NSDictionary *dict in dictArray){
            FriendGroup *fgoup = [FriendGroup gourpWithDict:dict];
            [gourpArray addObject:fgoup];
        }
        _groups = gourpArray;
    }
    return _groups;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    FriendGroup *group = self.groups[section];
    return group.friends.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"friend";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    []
    
    return nil;
}



@end
