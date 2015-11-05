// init:

// methods:
  -(NSArray) arrayWithObjects 
  // must end with nil
  // [NSArray arrayWithObjects:@"Hungarian", @"Swedish", nil];
  // shorthand:
  // @[<object>, <object>, nil]

// instance methods:
  -(NSMutableArray) mutableCopy
  // [someArray mutableCopy];


// instance properties: 
  count // length
  [<index>] // index access


=== NSMutableArray ===

// instance methods: 
  addObject
  // desc: push to an array
  // [self.dragons addObject:dragon];