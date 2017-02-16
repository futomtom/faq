
//: ## Just code fragment, other are full workable playground
//: ### background task

coreDataStack.storeContainer.performBackgroundTask { (context) in
    var results: [JournalEntry] = []
    do {
        results = try context.fetch(self.surfJournalFetchRequest())
    } catch let error as NSError {
        print("ERROR: \(error.localizedDescription)")
}
    
//: ### query generation
  
    try container.viewContext.setQueryGenerationFromToken(NSQueryGenerationToken.currentQueryGenerationToken)
    


//: ### background context
    let privateContext = CoreDataStack().persistentContainer.newBackgroundContext()
    let variable = entityObject(context: privateContext)
    // update proterty of variable
    
    try privateContext.save()

    
 //: ### fetchedResultsController
    fetchedResultsController  要有一個fetch request , context, section(optinal) , cacheName(optinal)
    
    let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                              managedObjectContext: coreDataStack.managedContext,
                                                              sectionNameKeyPath: #keyPath(Team.qualifyingZone),
                                                              cacheName: "worldCup")
    fetchedResultsController.delegate = self

//: ### asyncFetchRequest
    let  asyncFetchRequest = NSAsynchronousFetchRequest<名稱>(fetchRequest: fetchRequest) { [unowned self] result:  in
        
        guard let venues = result.finalResult else {
            return
        }
        self.venues = venues
        self.tableView.reloadData()
}
//: ### batch request
    let batchUpdate = NSBatchUpdateRequest(entityName: "Venue")
    batchUpdate.propertiesToUpdate = [#keyPath(Venue.favorite) : true]
    batchUpdate.affectedStores = coreDataStack.managedContext.persistentStoreCoordinator?.persistentStores
    batchUpdate.resultType = .updatedObjectsCountResultType  // how many oobject modified.



