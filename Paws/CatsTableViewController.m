//
//  CatsTableViewController.m
//  Paws
//
//  Created by 陳昱宏 on 2020/9/17.
//  Copyright © 2020 iknisy. All rights reserved.
//

#import "CatsTableViewController.h"
#import "DataService.h"
#import "CatModel.h"
#import "CatsTableViewCell.h"
@import FirebaseAuth;

@interface CatsTableViewController ()

@end

@implementation CatsTableViewController

//NSString *className = @"";
//- (instancetype)initWithStyle:(UITableViewStyle)style className:(NSString *)name {
//    self = [super initWithStyle:style];
//    if (self != nil) {
//        className = name;
//    }
//    return self;
//}
NSMutableArray* cats;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self.tableView registerNib:[UINib nibWithNibName:@"CatsTableViewCell" bundle:nil] forCellReuseIdentifier:@"catCell"];
    self.tableView.rowHeight = 350;
    self.tableView.allowsSelection = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSString *uidInUserDefaults = (NSString *) [NSUserDefaults.standardUserDefaults valueForKey:@"uid"];
    FIRUser *currentUser = FIRAuth.auth.currentUser;
    if (uidInUserDefaults == nil || currentUser == nil){
        UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController *controller = [mainStoryBoard instantiateViewControllerWithIdentifier:@"Login"];
        controller.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:controller animated:YES completion:nil];
    }else{
        [self observeData];
    }
}

-(void) observeData {
    [DataService.sharedInstance.RESULTS_REF observeEventType:(FIRDataEventTypeValue) withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        if (cats == nil) {
            cats = [[NSMutableArray alloc] init];
        }else {
            [cats removeAllObjects];
        }
        NSArray<FIRDataSnapshot *> *snapshots = snapshot.children.allObjects;
        if (snapshots == nil) {
            return;
        }
        for (FIRDataSnapshot *snap in snapshots) {
            CatModel *cat = [[CatModel alloc] initWithDict:snap.value];
            [cats addObject:cat];
        }
        [self.tableView reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return cats.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    CatsTableViewCell *cell = (CatsTableViewCell*) [tableView dequeueReusableCellWithIdentifier:@"catCell" forIndexPath:indexPath];
    CatsTableViewCell *cell = (CatsTableViewCell*) [NSBundle.mainBundle loadNibNamed:@"CatsTableViewCell" owner:self options:nil][0];
    // Configure the cell...
    
    CatModel *cat = cats[indexPath.row];
    cell.catNameLabel.text = cat.Name;
    cell.catCreditLabel.text = cat.Credit;
    cell.catVotesLabel.text = [NSString stringWithFormat:@"%@ Votes", cat.Vote];
    cell.votes = cat.Vote;
    cell.catImageView.image = nil;
    cell.index = indexPath.row;
    NSURL *url = [NSURL URLWithString:cat.Url];
    if (url != nil) {
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:5.0];
//        [NSOperationQueue.mainQueue cancelAllOperations];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error == nil && data != nil) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.catImageView.image = [UIImage imageWithData:data];
                });
            }
        }];
        [task resume];
    }
    
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
