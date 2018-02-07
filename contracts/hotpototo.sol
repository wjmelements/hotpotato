pragma solidity^0.4.18;
interface ERC20 {
    function totalSupply() public constant returns (uint supply);
    function balanceOf(address _owner) public constant returns (uint balance);
    function transfer(address _to, uint _value) public returns (bool success);
    function transferFrom(address _from, address _to, uint _value) public returns (bool success);
    function approve(address _spender, uint _value) public returns (bool success);
    function allowance(address _owner, address _spender) public constant returns (uint remaining);
    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}
contract HotPototo is ERC20 {
    uint8 public constant decimals = 0;
    string public symbol = "HPO";
    string public name = "HotPototo";

    address public owner;
    uint256 timestamp;
    function HotPotato() public {
        owner = msg.sender;
        timestamp = now;
    }

    function whoHasTheHotPotato()
    public view returns (address) {
        return owner;
    }

    function totalSupply()
    public constant
    returns (uint256) {
        return 1;
    }
    function balanceOf(address _owner) public constant returns (uint balance) {
        return owner == _owner ? 1 : 0;
    }
    function transfer(address _to, uint _value) public returns (bool success) {
        require(msg.sender == owner);
        uint256 diff = now - timestamp;
        require(msg.gas > diff / 15 seconds); // HOT
        owner = _to;
        Transfer(msg.sender, _to, 1);
        return true;
    }
    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
        return false;
    }
    function approve(address _spender, uint _value) public returns (bool success) {
        return false;
    }
    function allowance(address _owner, address _spender) public constant returns (uint remaining) {
        return 0;
    }
    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}
