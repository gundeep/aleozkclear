# aleozkclear

![Image Alt text](zkclear01/src/assets/zkclearlogo.png "Optional title")

[_WIP project_] A simple web app to demonstrate how to use ZK proofs to prove
 that an wallet address is OFAC sanctions free using the ZK proofs.

### Start in development mode

```bash
npm run dev
```

Your app should be running on http://localhost:5173/

1. In the `worker.js` file modify the privateKey to be an account with available
   funds

   ```js
   // Use existing account with funds
   const account = new Account({
     privateKey: "user1PrivateKey",
   });
   ```

In order to build LEO programs:

### Build Leo program

1. Replace `PRIVATE_KEY=user1PrivateKey` in the `.env` with your own key (you
   can use an existing one or generate your own at https://aleo.tools/account)

2. Follow instructions to install Leo here: https://github.com/AleoHQ/leo

3. You can edit `zkclear01/src/main.leo` and run `leo run` to compile and update the
   Aleo instructions under `build` which are loaded by the web app.
