pragma solidity ^0.8.0;

import "./ItemManager.sol";

contract Item {
    uint priceInWei;
    uint paidWei;
    uint index;

    ItemManager parentContract;

    constructor(ItemManager _parentContract, uint _priceInWei, uint _index) {
        priceInWei = _priceInWei;
        index = _index;
        parentContract = _[parentContract];
    }

    receive() external payable {
        require(msg.value == priceInWei, "Partial payments are not accepted at this time");
        require(paidWei == 0, "Item has already been pair for");
        paidWei += msg.value;
        (bool success) = address(parentConract).call{value: msg.value} ( abi.encodeWithSignature("triggerPayment(uint256)", index));
        require(success, "Item was not delivered");
    }

    fallback() external {

    }
    
}