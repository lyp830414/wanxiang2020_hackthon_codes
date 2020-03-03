# wanxiang2020_hackthon_codes
wanxiang2020_hackthon_codes

1. modify lyp_bios-boot-tutorial.py file with 'HOME_DIR' to set to your home directory, like r'/home/lyp830414'

2. run python 'lyp_bios-boot-tutorial.py -a' for the first time running.

3. If you need to stop all nodes, you must run as 'pkill nodes', forbid to use '-9' option!!! otherwise you have to remove all eos_data_dir* and retry step 2.

4. run 'python3 lyp_bios-boot-tutorial.py -a --iscontine' for all later round (due to you have the history data there).

5. You need to use python3.  2.x is not supported here.

6. This script is developped based on EOS 2.X with new features, and must based on OS with ubuntu 18.X LTS in x64 bits.
