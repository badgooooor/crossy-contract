pragma solidity >=0.4.21 <0.7.0;

contract Forward {
  enum State { Ongoing, Inactive, Completed }
  struct ContractData {
    string sender;
    uint amount;
    State state;
  }

  uint contractCount = 0;
  ContractData[] public contracts;

  modifier condition(bool _condition) {
    require(_condition, "Invalid condition");
    _;
  }

  event ContractEvent(uint amount);

  function insert(uint _amount, string memory _sender) public returns (uint rowNumber) {
    ContractData memory newContract;
    newContract.sender = _sender;
    newContract.amount = _amount;
    newContract.state = State.Ongoing;

    contracts.push(newContract);
    contractCount++;
    return contractCount;
  }

  function get(uint256 id) public view returns (uint amount, string memory sender) {
    return (contracts[id].amount, contracts[id].sender);
  }
}