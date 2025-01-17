//SPDX-License-Identifier: MIT

/**
 * Layout of the contract
 * version
 * imports
 * errors
 * interfaces, libraries, and contracts
 * type declarations
 * state variables
 * events
 * modifiers
 * functions
 *
 * layout of functions
 * constructor
 * receive function
 * fallback function
 * external functions
 * public functions
 * internal functions
 * private functions
 * view functions
 * pure functions
 * getters
 */
pragma solidity ^0.8.20;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**
 * @title Chainvoice
 * @author Karan Kumawat
 * @notice  A contract that allows users to request invoice payment and sent payment to another user
 */

contract Chainvoice {
    struct InvoiceDetails {
        address from;        // Sender's address
        address to;          // Receiver's address
        uint256 amountDue;   // Amount to be paid
        bool isPaid;         // Payment status
    }

    // Nested mapping for storing payment requests
    mapping(address => mapping(address => InvoiceDetails)) public payToRequest;

    // Mapping to store all invoices initiated by a user
    mapping(address => InvoiceDetails[]) public sentRequests;

    // Mapping to store all invoices received by a user
    mapping(address => InvoiceDetails[]) public receivedRequests;

    /**
     * @dev Create a new invoice request
     * @param amountDue The amount requested in the invoice
     * @param to The address of the receiver
     */
    function createInvoice(uint256 amountDue, address to) external {
        require(amountDue > 0, "Amount must be greater than zero");
        require(to != address(0), "Receiver address cannot be zero");

        // Store the invoice details in the mapping
        payToRequest[to][msg.sender] = InvoiceDetails({
            from: msg.sender,
            to: to,
            amountDue: amountDue,
            isPaid: false
        });

        // Track the request in the sentRequests mapping
        sentRequests[msg.sender].push(InvoiceDetails({
            from: msg.sender,
            to: to,
            amountDue: amountDue,
            isPaid: false
        }));

        // Track the request in the receivedRequests mapping
        receivedRequests[to].push(InvoiceDetails({
            from: msg.sender,
            to: to,
            amountDue: amountDue,
            isPaid: false
        }));
    }

    /**
     * @dev Pay an invoice request using Ether
     * @param sender The address of the sender who created the invoice
     */
    function payRequest(address sender) external payable {
        InvoiceDetails storage invoice = payToRequest[msg.sender][sender];

        require(invoice.amountDue > 0, "No outstanding payment");
        require(!invoice.isPaid, "Invoice already paid");
        require(msg.value == invoice.amountDue, "Incorrect payment amount");

        // Transfer Ether to the sender
        payable(sender).transfer(msg.value);

        // Mark the invoice as paid
        invoice.isPaid = true;
        invoice.amountDue = 0;

        // Update the received request to mark it as paid
        for (uint256 i = 0; i < receivedRequests[msg.sender].length; i++) {
            if (
                receivedRequests[msg.sender][i].from == sender &&
                receivedRequests[msg.sender][i].amountDue > 0 &&
                !receivedRequests[msg.sender][i].isPaid
            ) {
                receivedRequests[msg.sender][i].isPaid = true;
                receivedRequests[msg.sender][i].amountDue = 0;
                break;
            }
        }
    }

    /**
     * @dev Get all invoices sent by the caller
     * @return An array of InvoiceDetails representing all sent requests
     */
    function getMySentRequests() external view returns (InvoiceDetails[] memory) {
        return sentRequests[msg.sender];
    }

    /**
     * @dev Get all invoices received by the caller
     * @return An array of InvoiceDetails representing all received requests
     */
    function getMyReceivedRequests() external view returns (InvoiceDetails[] memory) {
        return receivedRequests[msg.sender];
    }
}
