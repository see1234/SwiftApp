//
//  QueueManager.swift
//  CleanSwift
//
//  Created by Marcos Kobuchi on 20/11/19.
//  Copyright © 2019 Undercaffeine. All rights reserved.
//

import Foundation

public class QueueManager {
    
    // Supported queues
    public enum QueueType { case main, concurrent, serial }
    
    /// Queue used to serial operations
    private var serialQueue: OperationQueue
    
    /// Queue used to concurrent operations
    private var concurrentQueue: OperationQueue
    
    /// Queue manager singleton instance
    public static let shared: QueueManager = QueueManager()
    
    /// Private initializer used to create and configure internal queues
    private init() {
        // initialize & configure serial queue
        serialQueue = OperationQueue()
        serialQueue.maxConcurrentOperationCount = 1
        
        // initialize & configure concurrent queue
        concurrentQueue = OperationQueue()
    }
    
    /// Function responsible for executing a block of code in a particular queue
    /// - params:
    ///     - NSBlockOperation: block operation to be executed
    ///     - QueueType: queue where the operation will be executed
    public func execute(_ blockOperation: BlockOperation, on queueType: QueueType) {
        // get queue where operation will be executed
        let queue: OperationQueue = self.getQueue(queueType)
        
        // execute operation
        queue.addOperation(blockOperation)
    }
    
    /// Function responsible for returning a specific queue
    /// params:
    ///     - QueueType: desired queue
    /// returns: queue in according to the given param
    private func getQueue(_ queueType: QueueType) -> OperationQueue {
        // queue to be returned
        var queue: OperationQueue
        
        // decide which queue
        switch queueType {
        case .concurrent:
            queue = self.concurrentQueue
        case .main:
            queue = OperationQueue.main
        case .serial:
            queue = self.serialQueue
        }
        
        return queue
    }
    
}
