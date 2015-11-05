UITableView

// How to implement UITableView manually

// === BAREBONES ===
init:
  // Drag a UITableView into ViewController 
  // Drag a UITableCell into ViewController 
    Go to attributes > set identifier to 'someId'

  // add delegates 
    // ui
    ctrl+drag self to donut check dataSource
    ctrl+drag self to donut check delegate 
  // add the two delegates to the interface
    @interface MainViewController () <UITableViewDataSource, 
                                      UITableViewDelegate>


required protocal methods: 
- (NSInteger)tableView:(UITableView *)tableView 
    numberOfRowsInSection:(NSInteger)section {
      // bare bones
      return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView 
    cellForRowAtIndexPath:(NSIndexPath *)indexPath {
      // bare bones
      return nil;
}

// === RENDER AN ARRAY ===

init:
  // all from above
  // add some array
  // @interface
    @property NSArray *someList;
    @property NSMutableArray *someMutableList;
      // remember to initialize the array!!!
      // Planet *planet1 = [[Planet alloc] initWithName:@"Mercury" distance:[NSNumber numberWithInt:100]];
      // self.planetsList = [NSMutableArray new];
      // [self.planetsList addObject:planet1];

required protocal methods:

- (NSInteger)tableView:(UITableView *)tableView 
    numberOfRowsInSection:(NSInteger)section {
      return self.vegatables.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"someTableCellId"];
    cell.textLabel.text = [NSString stringWithFormat:@"Hello! %@ %ld", self.someList[indexPath.row], (long)indexPath.row];
    return cell;
}

// === STYLE SUBTITLE ===

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"someId"];
    cell.textLabel.text = @"someTitle";
    cell.detailTextLabel.text = @"someSubtitel";
    return cell;
}

// === SEGUE FROM CLICK ===

// #import DetailViewController.h
// @property (weak, nonatomic) IBOutlet UITableView *tableView;

- (void)prepareForSegue:(id)segue sender:(UITableViewCell*)sender {
    
    DetailViewController *vc = [segue destinationViewController];
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    vc.publicProperty1 = self.someArray[path.row];
  
}

// in DetailViewController.h expose publicProperty1