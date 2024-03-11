测试网地址转入合约地址

polygon跨链桥合约地址：
0xD0331409e8D6BE3A144a847fe60857142b3F3B27

ethereum跨链桥合约地址：
0x09e1fB1F074389C12Bbe80A10e863f6f25a63Ac9

avalanche跨链桥合约地址：
0x18ee27Ca7AfAF10C585119F4ab2b9bE91000aBfc

okx跨链桥合约地址：
0x8F78A473A7Cb01194986062d66DB26B6db177AD0

bsc跨链桥合约地址：
0x6cd8C98CE70F8D634A403382b3d116621BC19d44


转入 YYMM的接口:
function sendToCosmos(
        address _tokenContract,
        bytes32 _destination,
        bytes32 _targetIBC,
        uint256 _amount
    ) public nonReentrant whenNotPaused

转出 YYMM的接口
function transferCrossChain(
    string memory recipient, 
    uint256 amount, 
    uint256 fee, 
    bytes32 target
  ) external returns (bool)
