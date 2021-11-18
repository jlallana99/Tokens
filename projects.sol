# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    projects.sol                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgallego <rgallego@student.42madrid>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/18 14:06:14 by rgallego          #+#    #+#              #
#    Updated: 2021/11/18 14:06:22 by rgallego         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

pragma solidity ^0.8.0;

import "./NFT42.sol";

contract Projects is NFT42 {
    uint256 private _startDate; // date: DDMMYYYY
    uint256 private _endDate;
    uint256 private _try;
    
    constructor (string memory name, string memory symbol, uint256 startDate_, uint256 endDate_, uint256 try_) NFT42(name,symbol) {
        _startDate = startDate_;
        _endDate = endDate_;
        _try = try_;
        owner = msg.sender;
        name = name;
        symbol = symbol;
    }
    
    /*** Setters ***/
    function setStartDay(uint256 day) public {
        _startDate = (day * 1000000) + (_startDate / 1000000);
    }
    
    function setStartMonth(uint256 month) public {
        _startDate = ((_startDate % 1000000) * 1000000) + (month * 10000) + (_startDate % 10000);
    }
    
    function setStartYear(uint256 year) public {
        _startDate = ((_startDate % 10000) * 10000) + year;
    }
    
    function setEndDay(uint256 day) public {
        _endDate = (day * 1000000) + (_endDate / 1000000);
    }
    
    function setEndMonth(uint256 month) public {
        _endDate = ((_endDate % 1000000) * 1000000) + (month * 10000) + (_endDate % 10000);
    }
    
    function setEndYear(uint256 year) public {
        _endDate = ((_endDate % 10000) * 10000) + year;
    }
    
    function setTry(uint256 try_) public {
       _try = try_;
    }
    
    /*** Getters ***/
    
    function getStartDay() public view returns (uint256) {
        return (_startDate % 1000000);
    }
