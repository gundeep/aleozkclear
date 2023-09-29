// The 'zkclear' program.
program zkclear.aleo {
    transition main(public addr1: address, addr2: address) -> bool {
        if (addr1 == addr2) {
            return true;
        }
        return false;
    }

    // Wallet Address to be checked
    // - `owner`     : The address of the account that needs to be verfied.
    // - `is_winner` : Whether the account is clear.
    record addrToBeChecked {
        owner: address,
        is_allowed: bool,
    }
}
