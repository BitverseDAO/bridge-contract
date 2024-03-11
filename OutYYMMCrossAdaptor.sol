// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "./BridgeAdaptorBase.sol";
contract OutYYMMCrossAdaptor is BridgeAdaptorBase {

    address immutable public YYMMcrossRouter;

    constructor(
        address _xBridge,
        address[] memory _routerList,
        address _yymmcrossRouter
    ) BridgeAdaptorBase(_xBridge, _yymmcrossRouter) {
        YYMMcrossRouter = _yymmcrossRouter;
    }

    function outboundBridgeTo(
        address _from,
        address _to,
        address, // _refundAddress,
        address _token,
        uint256 _amount,
        uint256 _toChainId,
        bytes memory _data
    ) external payable override onlyXBridge {
        (int64 _relayerFeePct, uint32  _quoteTimestamp) = abi.decode(_data, (int64, uint32));
        _token.transferCrossChain(
            addressToString(_to),
            _amount,
            _relayerFeePct,
            bytes32(_toChainId)
        );
        
        emit LogOutboundBridgeTo(_from, _to, _token, _amount, bytes32(""));
    }

 function addressToString(address _address) public pure returns (string memory) {
        bytes32 value = bytes32(uint256(_address));
        bytes memory alphabet = "0123456789abcdef";

        bytes memory str = new bytes(42);
        str[0] = '0';
        str[1] = 'x';
        for (uint256 i = 0; i < 20; i++) {
            str[2 + i * 2] = alphabet[uint8(value[i + 12] >> 4)];
            str[3 + i * 2] = alphabet[uint8(value[i + 12] & 0x0f)];
        }
        return string(str);
    }

}
