// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReviewSystem {
    struct Review{
        address reviewer;
        uint8 rating;
        string comment;
    }

    struct Reviewer {
        address reviewer;
        Review[] reviews;
    }

    mapping (address => Reviewer) public  reviewers;

    // Add event to trigger whenever a review added
    event ReviewAdded(address indexed reviewer, uint8 rating, string comment);

    // Add function to write review with rating between 1 and 5
    function writeReview(uint8 _rating, string memory _comment) public {
        require(_rating >= 1 && _rating <=5);

        Review memory newReview = Review(msg.sender, _rating, _comment);
        reviewers[msg.sender].reviews.push(newReview);

        //trigger the event here
        emit ReviewAdded(msg.sender, _rating, _comment);
    }

    // Add function to get reviews
    function getReviews(address _reviewer) public view returns (Review[] memory) {
        return reviewers[_reviewer].reviews;

    } 

}