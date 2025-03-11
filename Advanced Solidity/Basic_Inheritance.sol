// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Parent contract
contract Animal {
    string public species;

    constructor(string memory _species) {
        species = _species;
    }

    function makeSound() public pure virtual returns (string memory) {
        return "Some generic animal sound";
    }
}

// Child contract Dog
contract Dog is Animal {
    constructor() Animal("Dog") {}

    function makeSound() public pure override returns (string memory) {
        return "Bark";
    }
}

contract Cat is Animal {
    constructor() Animal("Dog") {}

    function makeSound() public pure override returns (string memory) {
        return "Meow";
    }
}
