#!/bin/bash
if [ $# -ne 1 ]
then
  echo "Need 1 Argument"
  exit 1
else
 sudo lxc-create -n $1 -t download -- -d ubuntu -r focal -a amd64
 sleep 5
 sudo lxc-start -n $1
 sudo lxc-attach -n $1 -- sudo apt-get update
 sleep 5
 sudo lxc-attach -n $1 -- bash -c "echo -e \"Y\n\" | sudo apt install openssh-server"
 sleep 20

 ./fakeDataCollection $1


 #Creates directories that act as emails sensitive information
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Personal_Information
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Friends_Contacts
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Promotion
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Social
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Important
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Personal_Information/googlePay

 #Addfiles to the Personal Info Directory
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"1600 Debra Dr, Waldorf MD, 20601-3312\" > ./Personal_Information/address"
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"First: John\nLast: Smith\n\nDate Of Birth: 3/13/1996\" > ./Personal_Information/Full_Name"
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"201-974-1024\" > ./Personal_Information/phone"
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"MasterCard: 5100 1234 5678 9012\n\nExp: 12/20\n\nName: John Smith\n\nCVV: 123\" > ./Personal_Information/googlePay/wallet"
 #adds contact information for people you know and send too
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Friends_Contacts/Brad
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Name: Brad Bento\n\ne-mail: bradtheman69@gmail.com\n\nPhone Number: 402-048-3013\" > ./Friends_Contacts/Brad/contactInformation"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Friends_Contacts/Dad
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Name: John Smith Sr.\n\ne-Mail: johnsdad@gmail.com\n\nPhone: 201-204-2233\n\nAddress: 32 Sycamore Street, MD\" > ./Friends_Contacts/Dad/contactInformation"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Friends_Contacts/Jimmy
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Name: Jimmy Smalls\n\ne-Mail: jimmysmalls123@gmail.com\n\nPhone Number: 201-342-0943\n\nAddress: 123 Playground Street\" > ./Friends_Contacts/Jimmy/contactInformation"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Friends_Contacts/Michelle
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Name: Michelle Thunberg\n\ne-Mail: mthunberg54@gmail.com\n\nPhone: 713-550-3722\" > ./Friends_Contacts/Michelle/contactInformation"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Friends_Contacts/Mom
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Name: Bernadette Smith\n\ne-Mail: bernadettesmith@gmail.com\n\nPhone: 201-001-9030\n\nAddress: 32 Sycamore Street, MD\" > ./Friends_Contacts/Mom/contactInformation"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Friends_Contacts/Monica
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Name: Monica Lewinsky\n\ne-Mail: monicaL42@gmail.com\n\nPhone: 201-992-0001\n\nAddress: White House, Washington DC\" > ./Friends_Contacts/Monica/contactInformation"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Friends_Contacts/Tom
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Name: Tom Littlesworth\n\ne-Mail: tomlittle@gmail.com\n\nPhone: 607-390-8410\" > ./Friends_Contacts/Tom/contactInformation"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Friends_Contacts/Veronica
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Name: Veronica van Buren\n\ne-Mail: vvb23@gmail.com\n\nPhone: 502-452-1059\" > ./Friends_Contacts/Veronica/contactInformation"

 #Adds accounts that your email is linked too and their usernames and password
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Promotion/Apple
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Username: jsmith@icloud.com\n\nPassword: g123jn51mn509kj\" > ./Promotion/Apple/userInfo"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Promotion/Chipotle
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e  \"Username: jsmith530\n\nPassword: j42345jnb34\" > ./Promotion/Apple/userInfo"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Promotion/GOAT
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Username: johnsmith23\n\nPassword: a0sd831n5321\" > ./Promotion/GOAT/userInfo"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Promotion/GrubHub
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Username: jsmith530\n\nPassword: j42345jnb34\" > ./Promotion/GrubHub/userInfo"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Promotion/Macys
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Username: jsmith530 \n\nPassword:kjh4q543kj\" > ./Promotion/Macys/userInfo"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Promotion/Microsoft_Office
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Username: johnsmith@gmail.com\n\nPassword: kj2h346l3uh5\" > ./Promotion/Microsoft_Office/userInfo"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Promotion/Netflix
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Username: johnsmith@gmail.com\n\nPassword: jh3462li1451bk\" > ./Promotion/Netflix/userInfo"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Promotion/Nike
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Username: johnsmith23 \n\nPassword: a0sd831n5321\" > ./Promotion/Nike/userInfo"

 sudo mkdir /var/lib/lxc/$1/rootfs/root/Social/Facebook
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Username: john_smith23\n\nPassword: JoNnYSmItH050189234\" > ./Social/Facebook/userInfo"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Social/Instagram
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Username: john_smith23\n\nPassword: JoNnYSmItH050189234\" > ./Social/Instagram/userInfo"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Social/Twitter
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Username: john_smith_23 \n\nPassword: klh4q1325hl09qwe\" > ./Social/Twitter/userInfo"
 sudo mkdir /var/lib/lxc/$1/rootfs/root/Social/Snapchat
 sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Username: _j0hnsm1th_23 \n\nPassword: bballisLIFE987\" > ./Social/Snapchat/userInfo"

digits=`sudo cat /var/lib/lxc/$1/rootfs/root/Personal_Information/googlePay/wallet | grep MasterCard | cut -d' ' -f4`

for ((i = 1 ; i <= 12 ; i++)); do
  for ((j = 16 ; j <= 22 ; j++)); do
   sudo lxc-attach -n $1 -- bash -c "cd && touch ./Important/\"Bank_Statement_$i-$j\""
   sudo lxc-attach -n $1 -- bash -c "cd && echo -e \"Capital One\nYou can now view online statements for the accounts listed below by signing on to Capital One Online Banking. Online statements may be accesses for up to 7 years on checking, savings, and money market accounts. Online statement history will not be available for accounts that have been close.\nAccount Number (last 4 digits)\nStatement Date\n -----------------------------------------------------------\nXXXX$digits\t\t$i/DD/20$j\" > ./Important/\"Bank_Statement_$i-$j\""
  done
done

./mitmSetup.sh $1 172.30.250.137
sleep 5

sudo sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /var/lib/lxc/$1/rootfs/etc/ssh/sshd_config

sudo lxc-attach -n $1 -- systemctl restart ssh

fi