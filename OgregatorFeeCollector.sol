// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Interfaces/IERC20.sol";

contract OgregatorFeeCollector {
    address public ogrelord;

    IERC20 public immutable OGRE =
        IERC20(0xAB8a1c03b8E4e1D21c8Ddd6eDf9e07f26E843492);

    address public immutable dead = 0x000000000000000000000000000000000000dEaD;

    modifier OnlyOgre() {
        require(msg.sender == ogrelord, "!ogrelord");
        _;
    }

    constructor() {
        ogrelord = msg.sender;
    }

    /// @notice collect Fees to EOA
    function recover(address[] calldata _tokens) external {
        for (uint256 i = 0; i < _tokens.length; ++i) {
            IERC20(_tokens[i]).transfer(
                ogrelord,
                IERC20(_tokens[i]).balanceOf(address(this))
            );
        }
    }

    /// @notice sends all OGRE in the contract to the burn address
    function burnOGRE() external {
        OGRE.transfer(dead, OGRE.balanceOf(address(this)));
    }

    function changeOgrelord(address _newOwner) external OnlyOgre {
        ogrelord = _newOwner;
    }
}
