// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DateCalculator {
    function isLeapYear(uint256 year) internal pure returns (bool) {
        if (year % 4 != 0) {
            return false;
        }
        if (year % 100 != 0) {
            return true;
        }
        if (year % 400 != 0) {
            return false;
        }
        return true;
    }

    function daysInMonth(uint256 month, uint256 year) internal pure returns (uint256) {
        if (month == 2) {
            return isLeapYear(year) ? 29 : 28;
        }
        uint8[12] memory daysArray = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        return daysArray[month - 1];
    }

    function calculateDateDifference(uint256 year1, uint256 month1, uint256 day1, uint256 year2, uint256 month2, uint256 day2) public pure returns (uint256) {
        require(year1 <= year2, "Year1 date should be lesser or equal to Year2");

        uint256 totalDays1 = day1;
        for (uint256 m = 1; m < month1; m++) {
            totalDays1 += daysInMonth(m, year1);
        }

        uint256 totalDays2 = day2;
        for (uint256 m = 1; m < month2; m++) {
            totalDays2 += daysInMonth(m, year2);
        }

        uint256 daysInYear1 = totalDays1 + (year1 - 1) * 365 + ((year1 - 1) / 4) - ((year1 - 1) / 100) + ((year1 - 1) / 400);
        uint256 daysInYear2 = totalDays2 + (year2 - 1) * 365 + ((year2 - 1) / 4) - ((year2 - 1) / 100) + ((year2 - 1) / 400);

        return daysInYear2 - daysInYear1;
    }
}
