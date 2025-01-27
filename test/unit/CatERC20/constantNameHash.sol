// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";

import { CatERC20 } from "../../../src/CatERC20.sol";

contract CatERC20ConstantNameHash is CatERC20 {
    function test() external {}

    constructor(string memory name, string memory symbol) CatERC20(name, symbol) {}

    function constantNameHash() external view returns(bytes32) {
        return _constantNameHash();
    }
}

contract ConstantNameHashTest is Test {
    function test_constant_name_hash(string calldata name, string calldata symbol) external {
        CatERC20ConstantNameHash tkn = new CatERC20ConstantNameHash(name, symbol);

        assertEq(tkn.constantNameHash(), keccak256(bytes(name)), "Name hash is not hash of name");
    }
}
