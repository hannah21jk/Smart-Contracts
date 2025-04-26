// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title A Simple Arithmetic Smart Contract
/// @author [Your Name]
/// @notice This contract stores two integers and emits their sum, difference, product, and quotient

contract SimpleCalculator {
    uint public A;
    uint public B;

    // Events to emit results
    event ValuesStored(uint a, uint b);
    event SumResult(uint result);
    event DifferenceResult(uint result);
    event ProductResult(uint result);
    event QuotientResult(uint result);

    // Constructor to initialize A and B
    constructor(uint _a, uint _b) {
        A = _a;
        B = _b;
        emit ValuesStored(A, B); // Emit the values after storing them
    }

    // Setter functions (if needed to change values after deployment)
    function setA(uint _a) public {
        A = _a;
    }

    function setB(uint _b) public {
        B = _b;
    }

    // Arithmetic functions, each emits its result
    function calculateSum() public {
        uint sum = A + B;
        emit SumResult(sum);
    }

    function calculateDifference() public {
        uint diff = A > B ? A - B : B - A; // ensure non-negative
        emit DifferenceResult(diff);
    }

    function calculateProduct() public {
        uint product = A * B;
        emit ProductResult(product);
    }

    function calculateQuotient() public {
        require(B != 0, "Cannot divide by zero");
        uint quotient = A / B;
        emit QuotientResult(quotient);
    }
}
