# wanxiang2020_hackthon_codes
wanxiang2020_hackthon_codes

A. How to start 5-nodes with the script
   
This script was modified by me & added activated 2.X boot contract feature from official site.

1. modify lyp_bios-boot-tutorial.py file with 'HOME_DIR' to set to your home directory, like r'/home/lyp830414'

2. run python 'lyp_bios-boot-tutorial.py -a' for the first time running.

3. If you need to stop all nodes, you must run as 'pkill nodes', forbid to use '-9' option!!! otherwise you have to remove all eos_data_dir* and retry step 2.

4. run 'python3 lyp_bios-boot-tutorial.py -a --iscontine' for all later round (due to you have the history data there).

5. You need to use python3.  2.x is not supported here.

6. This script is developped based on EOS 2.X with new features, and must based on OS with ubuntu 18.X LTS in x64 bits.

B. How to create new account

Here goes an example. We created a new account 'liyipingabcd' and supply with an initial token.

lyp830414@lyp830414-JASPER12:~/release$ ./cleos create key --to-console
Private key: 5KZDtcGLEDx42CuDrAfBPMrGKZCvDQQaVguXi4KkYgJvBHW7LsS
Public key: EOS5wGxefB6E7Smo1BisJaK1DgRdS5egMryjQ6W6dnzt8PtjtKDXj
lyp830414@lyp830414-JASPER12:~/release$ 
lyp830414@lyp830414-JASPER12:~/release$ 
lyp830414@lyp830414-JASPER12:~/release$ ./cleos system newaccount eosio liyipingabcd EOS5wGxefB6E7Smo1BisJaK1DgRdS5egMryjQ6W6dnzt8PtjtKDXj EOS5wGxefB6E7Smo1BisJaK1DgRdS5egMryjQ6W6dnzt8PtjtKDXj --stake-cpu '5.0000 TOKEN' --stake-net '5.0000 TOKEN' --buy-ram '5.0000 TOKEN'
executed transaction: 65274e9e22304542ab6898e7d71aaa5097f928f24e76ab1d5a1d56d1ee262c67  344 bytes  3556 us
#         eosio <= eosio::newaccount            {"creator":"eosio","name":"liyipingabcd","owner":{"threshold":1,"keys":[{"key":"EOS5wGxefB6E7Smo1Bis...
#         eosio <= eosio::buyram                {"payer":"eosio","receiver":"liyipingabcd","quant":"5.0000 TOKEN"}
#         eosio <= eosio::delegatebw            {"from":"eosio","receiver":"liyipingabcd","stake_net_quantity":"5.0000 TOKEN","stake_cpu_quantity":"...
#   eosio.token <= eosio.token::transfer        {"from":"eosio","to":"eosio.ram","quantity":"4.9750 TOKEN","memo":"buy ram"}
#   eosio.token <= eosio.token::transfer        {"from":"eosio","to":"eosio.ramfee","quantity":"0.0250 TOKEN","memo":"ram fee"}
#         eosio <= eosio.token::transfer        {"from":"eosio","to":"eosio.ram","quantity":"4.9750 TOKEN","memo":"buy ram"}
#     eosio.ram <= eosio.token::transfer        {"from":"eosio","to":"eosio.ram","quantity":"4.9750 TOKEN","memo":"buy ram"}
#         eosio <= eosio.token::transfer        {"from":"eosio","to":"eosio.ramfee","quantity":"0.0250 TOKEN","memo":"ram fee"}
#  eosio.ramfee <= eosio.token::transfer        {"from":"eosio","to":"eosio.ramfee","quantity":"0.0250 TOKEN","memo":"ram fee"}
#   eosio.token <= eosio.token::transfer        {"from":"eosio","to":"eosio.stake","quantity":"10.0000 TOKEN","memo":"stake bandwidth"}
#         eosio <= eosio.token::transfer        {"from":"eosio","to":"eosio.stake","quantity":"10.0000 TOKEN","memo":"stake bandwidth"}
#   eosio.stake <= eosio.token::transfer        {"from":"eosio","to":"eosio.stake","quantity":"10.0000 TOKEN","memo":"stake bandwidth"}
warning: transaction executed locally, but may not be confirmed by the network yet         ] 
lyp830414@lyp830414-JASPER12:~/release$ 
lyp830414@lyp830414-JASPER12:~/release$ 
lyp830414@lyp830414-JASPER12:~/release$ 
lyp830414@lyp830414-JASPER12:~/release$ ./cleos get account liyipingabcd
created: 2020-03-04T18:33:28.000
permissions: 
     owner     1:    1 EOS5wGxefB6E7Smo1BisJaK1DgRdS5egMryjQ6W6dnzt8PtjtKDXj
        active     1:    1 EOS5wGxefB6E7Smo1BisJaK1DgRdS5egMryjQ6W6dnzt8PtjtKDXj
memory: 
     quota:     335.2 KiB    used:     2.926 KiB  

net bandwidth: 
     delegated:     5.0000 TOKEN           (total staked delegated to account from others)
     used:                 0 bytes
     available:        2.598 KiB  
     limit:            2.598 KiB  

cpu bandwidth:
     delegated:     5.0000 TOKEN           (total staked delegated to account from others)
     used:                 0 us   
     available:          507 us   
     limit:              507 us   


lyp830414@lyp830414-JASPER12:~/release$
lyp830414@lyp830414-JASPER12:~/release$ ./cleos transfer eosio liyipingabcd '100.0000 TOKEN' 'init token'
executed transaction: 482987c1a2d54016fc31994fbf814c41771d569e695b5c96b156cdd09c33645a  136 bytes  638 us
#   eosio.token <= eosio.token::transfer        {"from":"eosio","to":"liyipingabcd","quantity":"100.0000 TOKEN","memo":"init token"}
#         eosio <= eosio.token::transfer        {"from":"eosio","to":"liyipingabcd","quantity":"100.0000 TOKEN","memo":"init token"}
#  liyipingabcd <= eosio.token::transfer        {"from":"eosio","to":"liyipingabcd","quantity":"100.0000 TOKEN","memo":"init token"}
warning: transaction executed locally, but may not be confirmed by the network yet         ] 
lyp830414@lyp830414-JASPER12:~/release$
lyp830414@lyp830414-JASPER12:~/release$ ./cleos get currency balance eosio.token liyipingabcd
100.0000 TOKEN
lyp830414@lyp830414-JASPER12:~/release$
