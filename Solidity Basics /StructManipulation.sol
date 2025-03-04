// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract StructManipulation{

    struct Person {
        string name;
        uint age;
        address wallet;
    }

    Person public person;

    constructor(string memory _name, uint _age, address _wallet){
        person = Person(_name,_age,_wallet);
    }
    
    function updatePerson(string memory _newName, uint _newAge, address _newWallet)public{
        Person memory tempPerson = person;  // Copy struct to memory (temporary variable)
        tempPerson.name = _newName;
        tempPerson.age = _newAge;
        tempPerson.wallet = _newWallet;

        person = tempPerson;
    }

}