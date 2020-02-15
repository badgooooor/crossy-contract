pragma solidity >=0.4.21 <0.7.0;

contract Forward {
  enum State { Ongoing, Inactive, Completed }
  State public state;

  uint contractCount = 0;
  mapping (uint256 => ContractData) contracts;

  struct ContractData {
    uint amount;
  }

  modifier condition(bool _condition) {
    require(_condition, "Invalid condition");
    _;
  }

  modifier inState(State _state) {
    require(state == _state, "Invalid state.");
    _;
  }

  event ContractEvent(uint amount);

  function insert(uint _amount) public returns (uint256) {
    ContractData memory newContract = ContractData(_amount);
    contracts[contractCount] = newContract;
    contractCount++;
    emit ContractEvent(_amount);
    return contractCount;
  }

  function get(uint256 contractId) public view returns (uint amount) {
    return (contracts[contractId].amount);
  }
}