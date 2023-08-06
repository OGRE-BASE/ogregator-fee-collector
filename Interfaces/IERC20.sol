// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function balanceOf(address _wallet) external view returns (uint256);

    function transfer(address _to, uint256 _amount) external;

    function transferFrom(address _from, address _to, uint256 _amount) external;

    function approve(address _spender, uint256 _amount) external;

    function allowance(address _spender) external view returns (uint256);
}