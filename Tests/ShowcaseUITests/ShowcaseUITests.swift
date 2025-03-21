import XCTest
import OSLog
import Foundation
import SkipBridge
@testable import ShowcaseUI

let logger: Logger = Logger(subsystem: "ShowcaseUI", category: "Tests")

@available(macOS 13, *)
final class ShowcaseUITests: XCTestCase {
    override func setUp() {
        #if os(Android)
        // needed to load the compiled bridge from the transpiled tests
        loadPeerLibrary(packageName: "skipapp-showcase-fuse", moduleName: "ShowcaseUI")
        #endif
    }

    func testShowcaseUI() throws {
        logger.log("running testShowcaseUI")
        XCTAssertEqual(1 + 2, 3, "basic test")
    }
}
