// The 'aleozkclear01' program.
program aleozkclear01.aleo {

    struct Addrlist {
    a0  :address, a1  :address , a2 : address, a3 : address,
    }

    transition main(
    public d1:u8,
    addrtocheck: address) -> bool {

    let boolarr: [bool; 2] = [true, false];


    let arr:[u8; 4] = [5,3,4,2]; 
                            //"aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7",
                            //"aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7",
                            //"aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7"];

    // Initialize the struct of data.
    let db: Addrlist = Addrlist { 
           a0: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
           a1: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
           a2: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
           a3: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,

        };

        assert(d1 < 30u8); // if current date is after 30 days from the date of the file creation. // return don't generate the proof.

        if (arr[0].eq(addrtocheck) ||  db.a2.eq(addrtocheck) || db.a3.eq(addrtocheck) || db.a3.eq(addrtocheck)) 
                { return false; }
        
        return true;
    }
}
