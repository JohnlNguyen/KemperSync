user=$(sed -n 1p ~/.kemperSync/info)
pc_num=$(sed -n 2p ~/.kemperSync/info)

has_key=$(ls -al ~/.ssh | grep id_rsa.pub)

if [ -z "$has_key" ]
	then
	echo "Please generate ssh key"
	echo "More info: https://tinyurl.com/jszhyld"
else
	echo "Adding ssh public to authorized_keys: "
	cmd=$(ssh $user@pc$pc_num.cs.ucdavis.edu "echo \"`cat ~/.ssh/id_rsa.pub`\" >> .ssh/authorized_keys")
fi