// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "./BridgeAdaptorBase.sol";
contract InYYMMCrossAdaptor is BridgeAdaptorBase {

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
        _approve2(_token, YYMMcrossRouter, _amount);
        YYMMcrossRouter.sendToCosmos(
            _token,
            bytes32(uint256(_token),
            bytes32(_toChainId),
            _amount
        );
        
        emit LogOutboundBridgeTo(_from, _to, _token, _amount, bytes32(""));
    }

}
