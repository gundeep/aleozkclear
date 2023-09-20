// The 'zkclear' program.
program zkclear.aleo {
    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }

    // Wallet Address to be checked
    // - `owner`     : The address of the account that needs to be verfied.
    // - `is_winner` : Whether the account is clear.
    record addrToBeChecked {
        owner: address,
        is_allowed: bool,
    }
}
