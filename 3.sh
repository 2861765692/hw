#!/bin/bash

function quick_sort()
{
	left=$1
	right=$2

	if [[ $1 -lt $2 ]]; then
		pivot=${arr[$1]}

		while(( $left < $right )); do
			while((${arr[$left]} <= $pivot && $left < $2)); do
				left=$(($left + 1))
			done

			while((${arr[$right]} > $pivot)); do
				right=$(($right-1))
			done

			if [[ $left -lt $right ]]; then
				tmp=${arr[$left]}
				arr[$left]=${arr[$right]}
				arr[$right]=$tmp
			fi
		done

		tmp=${arr[$right]}
		arr[$right]=${arr[$1]}
		arr[$1]=$tmp
		tmp=$right

		quick_sort $1 $((right-1)) arr
		quick_sort $((tmp+1)) $2 arr
	fi
}

function main()
{
	echo "Please input the total number of elements in the array:"
	read count
	echo "Please input the elements to the array one by one:"
	for((i=0; i<$count; i++)); do
		read arr[i]
	done

	quick_sort 0 $((count-1)) arr

	echo "After quick sorting, elements in the array are as follows:"
	for((i=0; i<count; i++)); do
		echo ${arr[$i]}
	done
}

main
