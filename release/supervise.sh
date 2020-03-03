#!/bin/bash

warn_cnts_tx1=0
warn_cnts_tx2=0
warn_cnts_sh1=0
warn_cnts_sh2=0
warn_cnts_sjp1=0
warn_cnts_sjp2=0

sh_cloud=(
)

dummy=(
)

tx_cloud=(
 127.0.0.1:8888
 127.0.0.1:8889
 127.0.0.1:8890
 127.0.0.1:8891
 127.0.0.1:8892
 127.0.0.1:8893

)

sjp_cloud=(
)


round=0
max_lib=0
lib=()
head=()
max_lib=0
max_lib_old=0
let old_lib=(0)

now1=`date +'%Y-%m-%d %H:%M:%S'`
now2=0
now3=0
#old1=0
#old2=0
#old3=0
duration=0
bad_conn_cnt1=0
bad_conn_cnt2=0
bad_conn_cnt3=0

if [ -f "/tmp/supervise.sh.pid" ]; then
	
	last_pid=`cat  /tmp/supervise.sh.pid`
	echo
	echo "check lastest pid: $last_pid"
	
	ps -fe|grep $last_pid |grep -v grep>/dev/null 2>&1

	if [ $? -ne 0 ]
	then
		echo
	else
		echo
		echo "Another same script is running, now exit."
		echo
		exit
	fi
fi

echo "my pid: $$"
echo $$>/tmp/supervise.sh.pid


while true
do

	value=()
	i=0

	echo
	echo "============= ROUND MAX_LIB: $max_lib ================================================================================"
	echo 
	echo "+++++++++++++  TX ++++++++++++++"
	echo

	for ip in ${tx_cloud[@]}
	do	
		#echo "TX IP: $ip"
		value=`curl --connect-timeout 3 http://$ip/v1/chain/get_info 2>/dev/null`
		#echo "TX: result: $?:"
		if [ $? -ne 0 ] || [ -z $value ]; then
			bad_conn_cnt1=`expr $bad_conn_cnt1 + 1`
			if [ -z "$old1" ] ; then
				if [ $bad_conn_cnt1 -gt 0 ]; then
					echo "BAD TX: $ip cannot connect"
					if [ $warn_cnts_tx1 -gt 1000 ]; then
						bad_conn_cnt1=0
						warn_cnts_tx1=0
						#old1=`date +'%Y-%m-%d %H:%M:%S'`
					fi
					warn_cnts_tx1=`expr $warn_cnts_tx1 + 1`
				fi
			else
				bad_conn_cnt1=0
				starttime=$old1
				endtime=`date +'%Y-%m-%d %H:%M:%S'`
				start_seconds=$(date --date="$starttime" +%s);
				end_seconds=$(date --date="$endtime" +%s);
				
				duration=$((end_seconds-start_seconds))
				echo "duration: $duration"	
				if [ $duration -gt 3600*8 ]; then #1 hr
					old1=`date +'%Y-%m-%d %H:%M:%S'`
				fi
			fi

			continue
		fi

		let lib[$i]=`echo $value | jq '.last_irreversible_block_num'`
		let head[$i]=`echo $value | jq '.head_block_num'`
		
		if [ ${lib[$i]} -gt $max_lib ]; then
			let max_lib=${lib[$i]}
		fi
		
		echo "ip: $ip, lib: ${lib[$i]}, head: ${head[$i]}, max_lib: $max_lib"
		
		if [ $round -le 0 ]; then
			continue
		elif [ ${lib[$i]} -lt $max_lib ] && [ `expr $max_lib - ${lib[$i]}` -gt 500 ]; then
			echo 'TOO SLOW'
		fi
		
		if [ ! -z ${old_lib[$i]} ]; then
			if [ ${old_lib[$i]} -eq ${lib[$i]} ]; then
				if [ -z "$old_stop_increasing1" ]; then
					echo "BAD TX: $ip: stop increasing"
					if [ $warn_cnts_tx2 -gt 1000 ]; then
						#old_stop_increasing1=`date +'%Y-%m-%d %H:%M:%S'`
						warn_cnts_tx2=0
					fi
					warn_cnts_tx2=`expr $warn_cnts_tx2 + 1`

				else        
					starttime=$old_stop_increasing1
					endtime=`date +'%Y-%m-%d %H:%M:%S'`													  start_seconds=$(date --date="$starttime" +%s);
					end_seconds=$(date --date="$endtime" +%s);
					duration=$((end_seconds-start_seconds))
					echo "duration: $duration"      
					if [ $duration -gt 3600*8 ]; then #1 hr
						old1=`date +'%Y-%m-%d %H:%M:%S'`
						old_stop_increasing1=`date +'%Y-%m-%d %H:%M:%S'`
					fi
			         fi
			fi
		fi

		let old_lib[$i]=${lib[$i]}	
		
		i=`expr $i + 1`
	done
	echo
	echo "+++++++++++++  SJP ++++++++++++++"
	echo
	
	for ip in ${sjp_cloud[@]}
	do	
		value=`curl --connect-timeout 3 http://$ip/v1/chain/get_info 2>/dev/null`
		#echo "SJP: result: $?"
		
		if [ $? -ne 0 ] || [ -z $value ]; then
			bad_conn_cnt2=`expr $bad_conn_cnt2 + 1`
			if [ -z "$old2" ] ; then
				if [ $bad_conn_cnt2 -gt 0 ]; then
				echo "BAD SJP: $ip cannot connect"
				
					if [ $warn_cnts_sjp1 -gt 1000 ]; then
						bad_conn_cnt2=0
						#old2=`date +'%Y-%m-%d %H:%M:%S'`
						warn_cnts_sjp1=0
					fi
					warn_cnts_sjp1=`expr $warn_cnts_sjp1 + 1`
				fi
			else
				bad_conn_cnt2=0
				starttime=$old2
				endtime=`date +'%Y-%m-%d %H:%M:%S'`
				start_seconds=$(date --date="$starttime" +%s);
				end_seconds=$(date --date="$endtime" +%s);
				
				duration=$((end_seconds-start_seconds))
					
				if [ $duration -gt 3600*8 ]; then #1 hr
					old2=`date +'%Y-%m-%d %H:%M:%S'`
				fi
			fi

			continue
		fi
		
		let lib[$i]=`echo $value | jq '.last_irreversible_block_num'`
		let head[$i]=`echo $value | jq '.head_block_num'`

		if [ ${lib[$i]} -gt $max_lib ]; then
			let max_lib=${lib[$i]}
		fi

		echo "ip: $ip, lib: ${lib[$i]}, head: ${head[$i]}, max_lib: $max_lib"
		
		if [ $round -le 0 ]; then
			continue
		elif [ ${lib[$i]} -lt $max_lib ] && [ `expr $max_lib - ${lib[$i]}` -gt 500 ]; then
			echo
		fi
		if [ ! -z ${old_lib[$i]} ]; then
			if [ ${old_lib[$i]} -eq ${lib[$i]} ]; then
				if [ -z "$old_stop_increasing2" ]; then
					echo "BAD SJP $ip: stop increasing"
					if [ $warn_cnts_sjp2 -gt 1000 ]; then
						#old_stop_increasing2=`date +'%Y-%m-%d %H:%M:%S'`
						warn_cnts_sjp2=0
					fi
						warn_cnts_sjp2=`expr $warn_cnts_sjp2 + 1`
				else        
					starttime=$old_stop_increasing2
					endtime=`date +'%Y-%m-%d %H:%M:%S'`													  			       start_seconds=$(date --date="$starttime" +%s);
					end_seconds=$(date --date="$endtime" +%s);
					duration=$((end_seconds-start_seconds))
					echo "duration: $duration"      
																					   				if [ $duration -gt 3600*8 ]; then #1 hr
					old1=`date +'%Y-%m-%d %H:%M:%S'`
					old_stop_increasing2=`date +'%Y-%m-%d %H:%M:%S'`
				     fi
		      	     	fi		     
			fi
		fi

		let old_lib[$i]=${lib[$i]}	
		
		i=`expr $i + 1`		
	done
	
	echo
	echo "+++++++++++++  SH ++++++++++++++"
	echo
	
	for ip in ${sh_cloud[@]}
	do	
		value=`curl --connect-timeout 3 http://$ip/v1/chain/get_info 2>/dev/null`
		#echo "SH: result: $?"
		
		if [ $? -ne 0 ] || [ -z $value ]; then
			bad_conn_cnt3=`expr $bad_conn_cnt3 + 1`
			if [ -z "$old3" ] ; then
				if [ $bad_conn_cnt3 -gt 0 ]; then
					echo "BAD SH $ip: cannot connect"
					if [ $warn_cnts_sh1 -gt 1000 ]; then
						bad_conn_cnt3=0
						#old3=`date +'%Y-%m-%d %H:%M:%S'`
						warn_cnts_sh1=0
					fi
					warn_cnts_sh1=`expr $warn_cnts_sh1 + 1`
				fi
			else
				bad_conn_cnt3=0
				starttime=$old3
				endtime=`date +'%Y-%m-%d %H:%M:%S'`
				start_seconds=$(date --date="$starttime" +%s);
				end_seconds=$(date --date="$endtime" +%s);
				
				duration=$((end_seconds-start_seconds))
				echo "SH HERE: duration: $duration"	
				if [ $duration -gt 3600*8 ]; then #1 hr
					old3=`date +'%Y-%m-%d %H:%M:%S'`
				fi
			fi

			continue
		fi
		

		let lib[$i]=`echo $value | jq '.last_irreversible_block_num'`
		let head[$i]=`echo $value | jq '.head_block_num'`


		if [ ${lib[$i]} -gt $max_lib ]; then
			let max_lib=${lib[$i]}
		fi

		echo "ip: $ip, lib: ${lib[$i]}, head: ${head[$i]}, max_lib: $max_lib"
		
		if [ $round -le 0 ]; then
			continue
		elif [ ${lib[$i]} -lt $max_lib ] && [ `expr $max_lib - ${lib[$i]}` -gt 500 ]; then
			echo
		fi	
		
		if [ ! -z ${old_lib[$i]} ]; then
			if [ ${old_lib[$i]} -eq ${lib[$i]} ]; then
				if [ -z "$old_stop_increasing3" ]; then
					echo "STOP INCREATEING SH :$ip"
					if [ $warn_cnts_sh2 -gt 1000 ]; then  
						#old_stop_increasing3=`date +'%Y-%m-%d %H:%M:%S'`
						warn_cnts_sh2=0
					fi
					warn_cnts_sh2=`expr $warn_cnts_sh2 + 1`
				else        
					starttime=$old_stop_increasing3
					endtime=`date +'%Y-%m-%d %H:%M:%S'`													  start_seconds=$(date --date="$starttime" +%s);
					end_seconds=$(date --date="$endtime" +%s);
					duration=$((end_seconds-start_seconds))
					echo "duration: $duration"      
			        fi

				if [ 0 ]; then #1 hr
					echo "STOP INCREASING 2"
					old1=`date +'%Y-%m-%d %H:%M:%S'`
					old_stop_increasing3=`date +'%Y-%m-%d %H:%M:%S'`
				    fi
			fi
		fi

		let old_lib[$i]=${lib[$i]}	
		
		i=`expr $i + 1`		
	done
		
	if [ $round -gt 0 ]; then
		if [ $max_lib_old -eq $max_lib ]; then
			delay_cnt=`expr $delay_cnt + 1`
			if [ $delay_cnt -ge 3600*8 ]; then # 1 hr
				delay_cnt=0
			fi
		fi
	fi
	
	max_lib_old=$max_lib

	round=1
	
	echo "If not sync blocks, please check all nodes' ntp timeslot, by ./ntp.sh script."

	sleep 300
done

