import XCTest
@testable import ProjectSingleViewApp

class ProjectSingleViewAppTests: XCTestCase {
    var sut: MainViewController!

    override func setUp() {
        sut = MainViewController()
    }

    func testExample() throws {
        let expected: Bool = sut.calculateBMI(sWeight: "90,9", sSize: "1,84")

        XCTAssertTrue(expected, "Teste falhou")
    }

    func test_CalculateBMI_WhenParametersAreZero_HasFalseReturn() throws {
        let expected: Bool = sut.calculateBMI(sWeight: "0", sSize: "0")

        XCTAssertFalse(expected, "Teste falhou")
    }

    func test_CalculateBMI_WhenWeightIsInvalid_HasFalseReturn() {
        let expected: Bool = sut.calculateBMI(sWeight: "*", sSize: "1,84")

        XCTAssertFalse(expected, "Test failed: test_CalculateBMI_WhenWeightIsInvalid_HasFalseReturn")
    }
}
