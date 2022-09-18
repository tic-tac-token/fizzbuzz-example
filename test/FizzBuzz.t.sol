// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/FizzBuzz.sol";

contract FizzBuzzTest is Test {
    FizzBuzz public fizzbuzz;

    function setUp() public {
       fizzbuzz = new FizzBuzz();
    }

    function test_fizzbuzz_returns_fizz_when_divisible_by_3() public {
        assertEq("fizz", fizzbuzz.fizzbuzz(3));
        assertEq("fizz", fizzbuzz.fizzbuzz(9));
        assertEq("fizz", fizzbuzz.fizzbuzz(12));
        assertEq("fizz", fizzbuzz.fizzbuzz(24));
    }

    function test_fuzz_fizzbuzz_returns_fizz_when_divisible_by_3(uint256 n) public {
        vm.assume(n % 3 == 0);
        vm.assume(n % 5 != 0);
        assertEq("fizz", fizzbuzz.fizzbuzz(n));
    }

    function test_fizzbuzz_returns_buzz_when_divisible_by_5() public {
        assertEq("buzz", fizzbuzz.fizzbuzz(5));
        assertEq("buzz", fizzbuzz.fizzbuzz(25));
        assertEq("buzz", fizzbuzz.fizzbuzz(100));
    }

    function test_fuzz_fizzbuzz_returns_buzz_when_divisible_by_5(uint256 n) public {
        vm.assume(n % 5 == 0);
        vm.assume(n % 3 != 0);
        assertEq("buzz", fizzbuzz.fizzbuzz(n));
    }

    function test_fizzbuzz_returns_fizzbuzz_when_divisible_by_3_and_5() public {
        assertEq("fizzbuzz", fizzbuzz.fizzbuzz(15));
        assertEq("fizzbuzz", fizzbuzz.fizzbuzz(30));
        assertEq("fizzbuzz", fizzbuzz.fizzbuzz(45));
    }

    function test_fuzz_fizzbuzz_returns_fizzbuzz_when_divisible_by_15(uint256 n) public {
        vm.assume(n % 5 == 0);
        vm.assume(n % 3 == 0);
        assertEq("fizzbuzz", fizzbuzz.fizzbuzz(n));
    }

    function test_fizzbuzz_returns_number_as_string_when_not_divisible_by_3_or_5() public {
        assertEq("17", fizzbuzz.fizzbuzz(17));
        assertEq("23", fizzbuzz.fizzbuzz(23));
        assertEq("97", fizzbuzz.fizzbuzz(97));
    }

    function test_fuzz_fizzbuzz_returns_number_as_string_otherwise(uint256 n) public {
        vm.assume(n % 5 != 0);
        vm.assume(n % 3 != 0);
        assertEq(Strings.toString(n), fizzbuzz.fizzbuzz(n));
    }
}
