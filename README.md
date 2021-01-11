## Overview
This article is a commentary on Preservation. Preservation uses the delegate call incorrectly, which includes the possibility of being hacked. Learn the correct use of delegatecall through this code.

## File structure
- Preservation
  - The contract that stores two addresses, one number and owner address.
- LibraryContract
  - Rewrite the storedNumber variable held by the Preservation contract.
- MyLibraryContrac
  - The contract by hacker to rewrite owners on behalf of Library Contracts.
- PreservationHack
  - Call the Preservation setSecondNumber function with call.

## Hacking flow
### User side
- Deploy Library Contract

- Set the contract address of LibraryContract to address1 and address2 of Preservation and deploy.

### Hacker side
- Deploy MyLibraryContract and PreservationHack.

- Specify the contract address of Preservation in argument of the hack function, the contract address of MyLibraryContract in libAddr and execute it.

- Execute the setFirstNumber function of Preservation.

### Process flow
①Call Preservation's setSecondNumber with the PreservationHack's hack function

②setSecondNumber calls LibraryContract setNumber function with a delegatecall

③The setNumber function replaces Address1 in Preservation with the contract address in MyLibraryContract

⑤Since the target address of the delegatecall has been changed to MyLibraryContract in the setFirstNumber function of Preservation, the owner is changed by the setNumber function.

<img width="601" alt="スクリーンショット 2021-01-11 8 02 57" src="https://user-images.githubusercontent.com/11623099/104138152-b8eba800-53e5-11eb-8224-2dd7f46cf3ee.png">
