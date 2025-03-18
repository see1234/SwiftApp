//
//  GenericCollectionDataSource.swift
//  CleanSwift
//
//  Created by Marcos Kobuchi on 16/06/20.
//  Copyright © 2020 Undercaffeine. All rights reserved.
//

import Foundation

public protocol CollectionView: NSObjectProtocol {
    func reloadData()
    func insert(at indexPaths: [IndexPath])
    func reload(at indexPaths: [IndexPath])
    func performBatchUpdates(_ updates: (() -> Void)?)
    
    @available(iOS 10.0, *)
    func prefetchDataSource(_ prefetchDataSource: Any)
    func delegate(_ delegate: Any)
    var refreshControl: UIRefreshControl? { get set }
}

protocol CollectionDataSourcePrefetching: AnyObject {
    func prefetch()
}

public class GenericCollectionDataSource<T: CollectionView>: NSObject {
    
    internal weak var collection: T?
    internal weak var delegate: AnyObject?
    internal weak var dataSourcePrefetching: CollectionDataSourcePrefetching?
    
    internal var sections: [Section] = []
    internal var identifiers: [String: String] = [:]
    
    internal var shouldClear: Bool = false
    internal var pageSize: Int = -1
    
    required public init(collection: T, delegate: AnyObject? = nil) {
        self.collection = collection
        self.delegate = delegate
    }
    
    required init(collection: T, dataSourcePrefetching: CollectionDataSourcePrefetching, delegate: AnyObject? = nil) {
        self.collection = collection
        self.dataSourcePrefetching = dataSourcePrefetching
        self.delegate = delegate
    }
    
    public func clear() {
        self.shouldClear = true
    }
    
    public func insert(sections: [Section], scrollToLast: Bool = false) {
        if self.shouldClear || self.sections.isEmpty {
            // clear and reload
            self.sections = sections
            self.shouldClear = false
            self.collection?.reloadData()
        } else {
            // append to end
            var sections = sections
            var indexPaths: [IndexPath] = []
            var forceReload: Bool = false
            
            for (xIndex, section) in self.sections.enumerated() {
                sections.removeAll { (newSection) -> Bool in
                    if section.headerViewModel?.tag == newSection.headerViewModel?.tag {
                        if newSection.reload {
                            section.items.removeAll()
                            forceReload = true
                        }
                        
                        let currentCount = section.items.count
                        let newCount = newSection.items.count
                        for current in currentCount..<currentCount+newCount {
                            indexPaths.append(IndexPath(row: current, section: xIndex))
                        }
                        
                        section.headerViewModel = newSection.headerViewModel
                        section.footerViewModel = newSection.footerViewModel
                        section.items.append(contentsOf: newSection.items)
                        
                        return true
                    } else {
                        return false
                    }
                }
            }
            
            if !sections.isEmpty || forceReload {
                self.sections.append(contentsOf: sections)
                self.collection?.reloadData()
            } else if !indexPaths.isEmpty {
                self.collection?.performBatchUpdates({
                    self.collection?.insert(at: indexPaths)
                })
            }
        }
        if self.collection?.refreshControl?.isRefreshing ?? false {
            self.collection?.refreshControl?.endRefreshing()
        }
    }
    
    public func update(sections: [Section]) {
        var indexPaths: [IndexPath] = []
        for newSection in sections {
            for (xIndex, section) in self.sections.enumerated() where section.headerViewModel?.tag == newSection.headerViewModel?.tag {
                var items = section.items
                
                for item3 in newSection.items {
                    for (row, item) in section.items.enumerated() where item.tag == item3.tag {
                        items[row] = item3
                        indexPaths.append(IndexPath(row: row, section: xIndex))
                        break
                    }
                }
                
                section.items = items
                break
            }
        }
        self.collection?.performBatchUpdates({
            self.collection?.reload(at: indexPaths)
        })
    }
    
    public func remove(sections: [Section]) {
        for sectionToDelete in sections {
            for section in self.sections where section.headerViewModel?.tag == sectionToDelete.headerViewModel?.tag {
                var items: [ViewModel?] = section.items
                
                for item3 in sectionToDelete.items {
                    for (row, item) in section.items.enumerated() where item.tag == item3.tag {
                        items[row] = nil
                        break
                    }
                }
                
                section.items = items.compactMap({ $0 })
                break
            }
        }
        self.collection?.reloadData()
    }
    
}
