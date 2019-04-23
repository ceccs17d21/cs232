
#!/bin/bash/

i=$1
j=$1
gate1=0
gate2=0

echo "process.sh started..."
echo "(adding results to result.txt)..."

readarray sem1 < result1.txt
readarray sem2 < result2.txt

echo "CEC CS_D 2017 result " > result.txt
echo >> result.txt
echo >> result.txt
echo ".Uty Reg no  .Name         .SGPA1  .SGPA2   .CGPA" >> result.txt

for i in ${sem2[*]}
do
	if echo "$i" | grep -q 'CHN17CS' ;
	then
		gate2=2
		echo >> result.txt
		echo -n "$i   " >> result.txt
		for j in ${sem1[*]}
		do
			if echo "$j" | grep -q "$i" ;
			then
				gate1=2
			elif [ $gate1 -gt 0 ];
			then
				
				
				gate1=`expr $gate1 - 1`
				if [ $gate1 -eq 1 ];
				then
					printf '%-14s' "$j" >> result.txt
				elif [ $gate1 -eq 0 ];
				then
					echo -n "$j     " >> result.txt
					sgpa1=$j
				fi
			elif [ $gate1 -eq 0 ];
			then
				gate1=-1
			fi
		done
	elif [ $gate2 -gt 0 ];
	then
		gate2=`expr $gate2 - 1`
		if [ $gate2 -eq 0 ];
		then
			echo -n "$i    " >> result.txt
			sgpa2=$i
			cgpa=`echo "scale=2;" $sgpa1/2+$sgpa2/2 | bc -l`
#			echo "scale=3;" | bc -l <<<"($sgpa1+$sgpa2)/2" >>result.txt
			echo -n "$cgpa" >> result.txt
			gate2=-1
		fi
	fi
done

#__________________________________________________________________________________________________________

#result.txt

:'
CEC CS_D 2017 result 


.Uty Reg no  .Name         .SGPA1  .SGPA2   .CGPA

CHN17CS004   ABIN          7.66     8.55    8.10
CHN17CS006   ADERSH        8.55     9.00    8.77
CHN17CS013   ALEN          7.11     8.55    7.82
CHN17CS017   AMAL          8.55     8.66    8.60
CHN17CS018   AMRITA        3.88     3.44    3.66
CHN17CS019   ANAKHA        8.66     8.88    8.77
CHN17CS021   ANIJA         7.55     8.00    7.77
CHN17CS022   ANJALI        3.22     3.88    3.55
CHN17CS023   ANUJA         5.00     3.77    4.38
CHN17CS024   ANUROSE       8.88     8.66    8.77
CHN17CS027   ARCHANA       8.11     8.22    8.16
CHN17CS029   ARUN          4.77     4.11    4.43
CHN17CS030   ASHISH        8.88     9.22    9.05
CHN17CS032   ASWIN         6.55     7.00    6.77
CHN17CS034   ATHIRA        6.88     7.44    7.16
CHN17CS037   AZHAR         6.00     4.77    5.38
CHN17CS038   BAMISHA       4.11     4.22    4.16
CHN17CS041   DARSANA       7.00     8.11    7.55
CHN17CS044   DEEPAK        8.33     9.11    8.71
CHN17CS045   DEVIKA        4.44     4.33    4.38
CHN17CS048   GEORGI        8.55     8.88    8.71
CHN17CS051   GOUTHAM       7.88     8.11    7.99
CHN17CS052   GOVIND        5.33     6.22    5.77
CHN17CS053   GRESHMA       8.77     9.11    8.93
CHN17CS054   HARIDEV       7.00     8.22    7.61
CHN17CS055   HARIKRISHNAN  6.55     7.44    6.99
CHN17CS057   JATHIN        8.44     9.66    9.05
CHN17CS058   JENY          8.00     9.44    8.72
CHN17CS063   JOEL          8.00     8.55    8.27
CHN17CS064   JOHAN         7.88     8.33    8.10
CHN17CS070   LENA          8.33     8.66    8.49
CHN17CS071   LINTA         5.00     5.11    5.05
CHN17CS074   MEGHA         3.66     4.44    4.05
CHN17CS076   MOHAMED       5.33     6.66    5.99
CHN17CS077   MONIYA        8.22     9.22    8.72
CHN17CS080   NIKHIL        8.22     8.11    8.16
CHN17CS083   NIRMAL        7.22     6.44    6.83
CHN17CS085   NITHYA        8.66     8.00    8.33
CHN17CS088   N             5.33     6.00    5.66
CHN17CS090   PRANAY        6.00     4.88    5.44
CHN17CS093   RITHU         7.77     8.55    8.15
CHN17CS094   RITTY         8.33     9.33    8.82
CHN17CS095   ROSHIN        8.33     9.11    8.71
CHN17CS097   SACHIN        8.66     9.11    8.88
CHN17CS100   SAYOOJ        6.77     7.44    7.10
CHN17CS101   SHABEERDAS    6.88     7.77    7.32
CHN17CS104   SHYLESH       7.88     8.11    7.99
CHN17CS106   SNEHA         5.77     5.77    5.76
CHN17CS109   SREELAL       3.33     1.88    2.60
CHN17CS110   STEPHEN       7.22     8.00    7.61
CHN17CS111   SURYA         7.33     9.11    8.21
CHN17CS113   THWALIB       6.55     7.88    7.21
CHN17CS114   VARGHESE      7.77     8.22    7.99
CHN17CS115   VIMAL         8.33     7.88    8.10
CHN17CS116   VISAKH        7.44     8.33    7.88
CHN17CS117   VISHAK        8.11     9.00    8.55
CHN17CS118   VISHNU        8.33     9.44    8.88
CHN17CS119   VYSHAKH       5.88     6.88    6.38
'

#___________________________________________________________________________________________________________

#result1.txt

:'
CEC CS_D 2017 result 


.Uty Reg no  .Name         .SGPA

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

#_______________________________________________________________________________________________________

#result2.txt

:'
CEC CS_D 2017 result 


.Uty Reg no  .Name         .SGPA

CHN17CS004    ABIN          8.55
CHN17CS006    ADERSH        9.00
CHN17CS013    ALEN          8.55
CHN17CS017    AMAL          8.66
CHN17CS018    AMRITA        3.44
CHN17CS019    ANAKHA        8.88
CHN17CS021    ANIJA         8.00
CHN17CS022    ANJALI        3.88
CHN17CS023    ANUJA         3.77
CHN17CS024    ANUROSE       8.66
CHN17CS027    ARCHANA       8.22
CHN17CS029    ARUN          4.11
CHN17CS030    ASHISH        9.22
CHN17CS032    ASWIN         7.00
CHN17CS034    ATHIRA        7.44
CHN17CS037    AZHAR         4.77
CHN17CS038    BAMISHA       4.22
CHN17CS041    DARSANA       8.11
CHN17CS044    DEEPAK        9.11
CHN17CS045    DEVIKA        4.33
CHN17CS048    GEORGI        8.88
CHN17CS051    GOUTHAM       8.11
CHN17CS052    GOVIND        6.22
CHN17CS053    GRESHMA       9.11
CHN17CS054    HARIDEV       8.22
CHN17CS055    HARIKRISHNAN  7.44
CHN17CS057    JATHIN        9.66
CHN17CS058    JENY          9.44
CHN17CS063    JOEL          8.55
CHN17CS064    JOHAN         8.33
CHN17CS070    LENA          8.66
CHN17CS071    LINTA         5.11
CHN17CS074    MEGHA         4.44
CHN17CS076    MOHAMED       6.66
CHN17CS077    MONIYA        9.22
CHN17CS080    NIKHIL        8.11
CHN17CS083    NIRMAL        6.44
CHN17CS085    NITHYA        8.00
CHN17CS088    N             6.00
CHN17CS090    PRANAY        4.88
CHN17CS093    RITHU         8.55
CHN17CS094    RITTY         9.33
CHN17CS095    ROSHIN        9.11
CHN17CS097    SACHIN        9.11
CHN17CS100    SAYOOJ        7.44
CHN17CS101    SHABEERDAS    7.77
CHN17CS104    SHYLESH       8.11
CHN17CS106    SNEHA         5.77
CHN17CS109    SREELAL       1.88
CHN17CS110    STEPHEN       8.00
CHN17CS111    SURYA         9.11
CHN17CS113    THWALIB       7.88
CHN17CS114    VARGHESE      8.22
CHN17CS115    VIMAL         7.88
CHN17CS116    VISAKH        8.33
CHN17CS117    VISHAK        9.00
CHN17CS118    VISHNU        9.44
CHN17CS119    VYSHAKH       6.88
LCHN17CS122    
LCHN17CS124    
LCHN17CS121    
LCHN17CS123    
'
