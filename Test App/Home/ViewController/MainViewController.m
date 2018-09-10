//
//  MainViewController.m
//  Test App
//
//  Created by Dina Mansour on 9/8/18.
//  Copyright © 2018 StarWallet Labs. All rights reserved.
//

#import "MainViewController.h"
#import "BaseModel.h"
#import "RowsModel.h"
#import "HeaderTableViewCell.h"
#import "HomeTableViewCell.h"
#import "ImageModel.h"


#import "AppDelegate.h"



@interface MainViewController (){
    BaseModel  *model;
    NSArray *titles;
    NSArray *images;
    ImageModel *imageModel;

   
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [UIHelper setDefualtUI:self];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
     [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"homeCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"HeaderTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"header"];
   
    id<Backend> clientManager = [ClientManager createInstance];
    [clientManager getSheet:self];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    if (titles.count!=0){
      return titles.count;
    }else{
        return 1;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
     CGFloat height = 45;
    if (indexPath.row!=0){
        height = 75;
    }
   
    //Calculate height for each cell
    return height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0){
    
    HeaderTableViewCell *cell1 = (HeaderTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"header"];
    
    if (cell1 == nil) {
        cell1 = [[[NSBundle mainBundle] loadNibNamed:@"HeaderTableViewCell" owner:self options:nil] lastObject];
    }
       
    return cell1;}else{
        
    
        HomeTableViewCell *cell2 = (HomeTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"homeCell"];
        
        if (cell2 == nil) {
            cell2 = [[[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCell" owner:self options:nil] lastObject];
        }
       
        cell2.tag = indexPath.row;
    
    // Configure the cell...
        
        cell2.title.text = titles[indexPath.row];
        if (indexPath.row<(imageModel.images.count)){
        if (imageModel.images[indexPath.row]!=nil){
           
            [cell2.image setImageWithURL:[NSURL URLWithString:imageModel.images[indexPath.row]]
                        placeholderImage:[UIImage imageNamed:@"logo.png"]];
        }
          
       
        }
        
   
    return cell2;}
      
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    
    
}
-(void)requestWillSend:(NSURLRequest *)request {
    [self checkConnection];
    if (![self hasInternet]) {
        [UIHelper showErrorMessage:Localized(@"NoNetworkMSG") Title:ApplicationName];
        return;
    }
    [UIHelper showProgressBarWithDimView];
}

-(void)successResponse:(RKObjectRequestOperation *)operation mappingresult:(NSArray *)mappingResult {
   
    
        
 
 
        model = [mappingResult lastObject];
    if (model!=nil){
        titles = (NSDictionary *) model.valueRanges[0].values.firstObject ;
        images = (NSDictionary *) model.valueRanges[1].values.firstObject ;
        imageModel = [[ImageModel alloc] init];
        imageModel.images = images ;
        [DatabaseHelper saveImages: imageModel] ;
     [self.tableView reloadData];
    }
    
    [UIHelper dissmissProgressBar];
    
}

-(void)failuerResponse:(RKObjectRequestOperation *)operation error:(NSError *)error{
    [UIHelper dissmissProgressBar];
    [UIHelper showErrorMessage:Localized(@"Login Failed") Title:ApplicationName];
}
@end


