# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    badgets.sol                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgallego <rgallego@student.42madrid>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/18 14:05:54 by rgallego          #+#    #+#              #
#    Updated: 2021/11/18 14:05:59 by rgallego         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

pragma solidity ^0.8.0;

import "./NFT42.sol";

contract Badgets is NFT42 {
    uint256 private _date; // date: DDMMYYYY
    string private _description;
    
    constructor (string memory name, string memory symbol, uint256 date_, string memory description_) NFT42(name,symbol) {
        _date = date_;
        _description = description_;
        owner = msg.sender;
        name = name;
        symbol = symbol;
    }
    
    /*** Setters ***/
    function setDescription(string memory description) public {
       _description = description;
    }
    
    function setDay(uint256 day) public {
        _date = (day * 1000000) + (_date / 1000000);
    }
    
    function setMonth(uint256 month) public {
        _date = ((_date % 1000000) * 1000000) + (month * 10000) + (_date % 10000);
    }
    
    function setYear(uint256 year) public {
        _date = ((_date % 10000) * 10000) + year;
    }
    
    /*** Getters ***/
    function getDescription() public view returns (string memory) {
        return (_description);
    }
    
    function getDay() public view returns (uint256) {
        return (_date % 1000000);
    }
    
    function getMonth() public view returns (uint256) {
        return (_date % 10000);
    }
    
    function getYear() public view returns (uint256) {
        return (_date / 10000);
    }
}
