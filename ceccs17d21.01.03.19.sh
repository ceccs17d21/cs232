

#!/bin/bash/

echo "process.sh started..."
echo "(adding results to result.txt)..."
i=$1
j=$1
limit=9
total=0
divisor=9
gate=0
gate1=0
flag=0

readarray cls_list < s4d.txt
readarray result_CHN < result_CHN.txt
echo "CEC CS_D 2017 result " > result.txt
echo >> result.txt
echo >> result.txt
echo ".Uty Reg no  .Name         .CGPA" >> result.txt

for i in ${cls_list[*]}
do
	if [ $gate1 -eq 1 ] ;
	then
#		echo -n "$i  " >> result.txt
#		echo -n $cgpa >> result.txt
		printf '%-13s %s' "$i" "$cgpa" >> result.txt
		gate1=0
	elif echo "$i" | grep -q 'CHN17CS' ;
	then
		echo >> result.txt
		echo -n "$i    " >> result.txt
		for j in ${result_CHN[*]}
		do
			if echo "$j" | grep -q "$i" ;
			then
				gate1=1
				gate=1  # 1:- open ; 0:- closed
			elif [ $gate -eq 1 -a $flag -lt 9 ]; 
			then 
				if echo "$j" | grep -q '(O)' ;
				then
					total=`expr $total + 10`
					flag=`expr $flag + 1`
				elif echo "$j" | grep -q '(A+)' ;
				then
					total=`expr $total + 9`
					flag=`expr $flag + 1`
				elif echo "$j" | grep -q '(A)' ;
				then
					total=`expr $total + 8`
					flag=`expr $flag + 1`
				elif echo "$j" | grep -q '(B+)' ;
				then
					total=`expr $total + 8`
					flag=`expr $flag + 1`
				elif echo "$j" | grep -q '(B)' ;
				then
					total=`expr $total + 7`
					flag=`expr $flag + 1`
				elif echo "$j" | grep -q '(C)' ;
				then
					total=`expr $total + 6`
					flag=`expr $flag + 1`
				elif echo "$j" | grep -q '(P)' ;
				then
					total=`expr $total + 5`
					flag=`expr $flag + 1`
				elif echo "$j" | grep -q '(F)' ;
				then
					total=`expr $total + 0`
					flag=`expr $flag + 1`
				elif echo "$j" | grep -q '(FE)' ;
				then
					total=`expr $total + 0`
					flag=`expr $flag + 1`
				elif echo "$j" | grep -q '(I)' ;
				then
					total=`expr $total + 0`
					flag=`expr $flag + 1`
				fi
				
			elif [ $flag -eq 9 ];
			then
				gate=0
				cgpa=`echo "scale=2;" $total / $divisor | bc -l`
#				echo $cgpa >> result.txt
				total=0
				flag=0
				break;
			fi
		done
	fi  
done

echo "terminating process.sh"


#_____________________________________________________________________________________________

#result.txt (s1 result)

: '
CEC CS_D 2017 result 


.Uty Reg no  .Name         .CGPA

CHN17CS004    ABIN          7.66
CHN17CS006    ADERSH        8.55
CHN17CS013    ALEN          7.11
CHN17CS017    AMAL          8.55
CHN17CS018    AMRITA        3.88
CHN17CS019    ANAKHA        8.66
CHN17CS021    ANIJA         7.55
CHN17CS022    ANJALI        3.22
CHN17CS023    ANUJA         5.00
CHN17CS024    ANUROSE       8.88
CHN17CS027    ARCHANA       8.11
CHN17CS029    ARUN          4.77
CHN17CS030    ASHISH        8.88
CHN17CS032    ASWIN         6.55
CHN17CS034    ATHIRA        6.88
CHN17CS037    AZHAR         6.00
CHN17CS038    BAMISHA       4.11
CHN17CS041    DARSANA       7.00
CHN17CS044    DEEPAK        8.33
CHN17CS045    DEVIKA        4.44
CHN17CS048    GEORGI        8.55
CHN17CS051    GOUTHAM       7.88
CHN17CS052    GOVIND        5.33
CHN17CS053    GRESHMA       8.77
CHN17CS054    HARIDEV       7.00
CHN17CS055    HARIKRISHNAN  6.55
CHN17CS057    JATHIN        8.44
CHN17CS058    JENY          8.00
CHN17CS063    JOEL          8.00
CHN17CS064    JOHAN         7.88
CHN17CS070    LENA          8.33
CHN17CS071    LINTA         5.00
CHN17CS074    MEGHA         3.66
CHN17CS076    MOHAMED       5.33
CHN17CS077    MONIYA        8.22
CHN17CS080    NIKHIL        8.22
CHN17CS083    NIRMAL        7.22
CHN17CS085    NITHYA        8.66
CHN17CS088    N             5.33
CHN17CS090    PRANAY        6.00
CHN17CS093    RITHU         7.77
CHN17CS094    RITTY         8.33
CHN17CS095    ROSHIN        8.33
CHN17CS097    SACHIN        8.66
CHN17CS100    SAYOOJ        6.77
CHN17CS101    SHABEERDAS    6.88
CHN17CS104    SHYLESH       7.88
CHN17CS106    SNEHA         5.77
CHN17CS109    SREELAL       3.33
CHN17CS110    STEPHEN       7.22
CHN17CS111    SURYA         7.33
CHN17CS113    THWALIB       6.55
CHN17CS114    VARGHESE      7.77
CHN17CS115    VIMAL         8.33
CHN17CS116    VISAKH        7.44
CHN17CS117    VISHAK        8.11
CHN17CS118    VISHNU        8.33
CHN17CS119    VYSHAKH       5.88
LCHN17CS122    
LCHN17CS124    
LCHN17CS121    
LCHN17CS123    
'

#___________________________________________________________________________________________

#in terminal

: '
georgi@georgiubuntu:~/Documents/script/env2$ ./process.sh 
process.sh started...
(adding results to result.txt)...
terminating process.sh
georgi@georgiubuntu:~/Documents/script/env2$ 

'
