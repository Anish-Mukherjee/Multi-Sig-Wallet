//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MultiSigWallet {
    address[] public owners;
    mapping(address=>bool) public isOwner;
    uint256 public numConfirmationsRequired;

    constructor(address[] memory _owners, uint256 _numConfirmationsRequired) {
        require(_owners.length > 0, "Owners required");
        require(
            _owners.length > 0 && _numConfirmationsRequired < _owners.length,
            "Invalid no. of required confirmations"
        );
        for (uint i = 0; i < _owners.length; i++){
            address owner = _owners[i];
            require(owner != address(0), "Invalid owner!");//Address 0 is where burnt tokens are sent
            require(!isOwner[owner], "owner not unique!");
            isOwner[owner] = true;
            owners.push(owner);
        }
        numConfirmationsRequired = _numConfirmationsRequired;
    }
}
