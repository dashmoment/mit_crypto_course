pragma solidity >= 0.4.22 < 0.9.0;

contract mit_greeting{
    // function hello() public pure returns (string memory){
    function hello() public pure returns (bytes32){
        return 'hello world';

    }
}