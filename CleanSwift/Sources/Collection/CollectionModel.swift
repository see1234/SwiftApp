//
//  CollectionModel.swift
//  CleanSwift
//
//  Created by Marcos Kobuchi on 20/11/19.
//  Copyright © 2019 Undercaffeine. All rights reserved.
//

import Foundation

public enum CollectionModel {
    
    public enum Get {
        public struct Request {
            public init(reload: Bool) { self.reload = reload }
            public let reload: Bool
        }
        public struct Response {
            public init(objects: [Any], reload: Bool, scrollToLast: Bool = false) {
                self.objects = objects
                self.reload = reload
                self.scrollToLast = scrollToLast
            }
            public let objects: [Any]
            public let reload: Bool
            public let scrollToLast: Bool
        }
        public struct ViewModel {
            public init(sections: [Section], reload: Bool, scrollToLast: Bool = false) {
                self.sections = sections
                self.reload = reload
                self.scrollToLast = scrollToLast
                
            }
            public let sections: [Section]
            public let reload: Bool
            public let scrollToLast: Bool
        }
    }
    
    public enum Update {
        public struct Response {
            public init(objects: [Any]) { self.objects = objects }
            public let objects: [Any]
        }
        public struct ViewModel {
            public init(sections: [Section]) { self.sections = sections }
            public let sections: [Section]
        }
    }
    
    public enum Delete {
        public struct Response {
            public init(objects: [Any]) { self.objects = objects }
            public let objects: [Any]
        }
        public struct ViewModel {
            public init(sections: [Section]) { self.sections = sections }
            public let sections: [Section]
        }
    }
    
    public enum SetClear {
        public struct Request {
            public init() {}
        }
    }
    
    public enum EndRefreshing {
        public struct Response {
            public init() {
            }
        }
        public struct ViewModel {
            public init() {
            }
        }
    }
    
}
