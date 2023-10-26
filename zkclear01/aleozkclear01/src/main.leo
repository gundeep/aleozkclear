// The 'aleozkclear01' program.
program aleozkclear01.aleo {

    struct Addrlist {
    a0  :address, a1  :address , a2 : address, a3 : address,
    // a4  :address, a5  :address , a6 : address, a7 : address,
    // a8  :address, a9  :address , a10: address, a11: address,
    // a12 :address, a13 :address , a14: address, a15: address,
    }

    transition main(
    public d1:u8,
    addrtocheck: address) -> bool {

    // Initialize the struct of data.
    let db: Addrlist = Addrlist { 
           a0: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
           a1: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
           a2: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
           a3: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
     //    a4: 123WBUDmSJv4GctdVEz6Qq6z8nXSKrJ4KX,
     //    a5: 123WBUDmSJv4GctdVEz6Qq6z8nXSKrJ4KX,
     //    a6: 123WBUDmSJv4GctdVEz6Qq6z8nXSKrJ4KX,
     //    a7: 123WBUDmSJv4GctdVEz6Qq6z8nXSKrJ4KX,
     //    a8: 123WBUDmSJv4GctdVEz6Qq6z8nXSKrJ4KX,
     //    a9: 123WBUDmSJv4GctdVEz6Qq6z8nXSKrJ4KX,
     //    a10: aleo0x0E3A09dDA6B20aFbB34aC7cD4A6881493f3E7bf7,
     //    a11: aleo0x0Ee5067b06776A89CcC7dC8Ee369984AD7Db5e06,
     //    a12: aleo0x12D66f87A04A9E220743712cE6d9bB1B5616B8Fc,
     //    a13: aleo0x1356c899D8C9467C7f71C195612F8A395aBf2f0a,
     //    a14: aleo0x169AD27A470D064DEDE56a2D3ff727986b15D52B,
     //    a15: aleo0x178169B423a011fff22B9e3F3abeA13414dDD0F1
        };

        if (d1 > 30){ // if current date is after 30 days from the date of the file creation.
            return false; // return don't generate the proof.
        }

        else if (db.a0.eq(addrtocheck) ||  db.a2.eq(addrtocheck) || db.a3.eq(addrtocheck) || db.a3.eq(addrtocheck) //|| 
                // db.a5.eq(addrtocheck) ||  db.a6.eq(addrtocheck) || db.a7.eq(addrtocheck) || db.a8.eq(addrtocheck) ||
                // db.a9.eq(addrtocheck) ||  db.a10.eq(addrtocheck) || db.a12.eq(addrtocheck) || db.a13.eq(addrtocheck) ||
                // db.a14.eq(addrtocheck) ||  db.a15.eq(addrtocheck) || db.a11.eq(addrtocheck) || db.a0.eq(addrtocheck)
                ) 
                { return false; }
        
        return true;
    }
}
