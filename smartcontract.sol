// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// receive eth at smart contract address
contract Receive {
    // arbitrary value until i get screenshots
    uint public price = 1 ether;
    // when i get screenshots it will be something like
    // function itemNumber()... {
    //    int public price = www.url.com/products/itemnumberprice
    // }

    constructor() payable {}

    receive() external payable {
        // verify if amount sent is greater than item price 
        if (msg.value < price) {
            // revert transaction if amount sent doesn't = price
            revert();
        }
    }

    // check smart contract balance
    function checkBal() external view returns(uint) {
        // returns balance
        return address(this).balance;
    }
}

// send eth to 3commas wallet
contract Send {
    constructor() payable {}

    receive() external payable {}

    // complete balance of the contract in wei
    uint public bal = address(this).balance;

    // sends received funds to 3commas wallet
    function sendFunds(address payable recipient) external {
        // send amount funds to 3commas wallet via call
        (bool success, ) = recipient.call{value: bal}("");
        // if transation unsuccessful
        require(success, "transaction failed");
    }
}