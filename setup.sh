is_valid=0
function validate(){
	if [ -z "$username" ]
  	then
    	echo "Invalid Username"
    elif [[ $pc -gt 50 ]] || [[ $pc -lt 1 ]]
  	then
    echo "Invalid PC number"
	else
		return 1
	fi
}
function clean_input(){
	username="$(echo "${username}" | tr -d '[:space:]')"
	username="$(echo "${username}" | tr -d '\n')"
	pc="$(echo "${pc}" | tr -d '[:space:]')"
	pc="$(echo "${pc}" | tr -d '\n')"
}

function get_input(){
	while [[ $is_valid -eq 0 ]]
	do
		read -p "Please enter your UC Davis username: " username
		read -p "Please enter a pc number: " pc
		validate
		local is_valid=$? 
	done
}

get_input
clean_input

if [ ! -d ~/.kemperSync/ ]; then
    git clone https://github.com/JohnlNguyen/KemperSync.git ~/.kemperSync
    touch ~/.kemperSync/info
    echo ""$username"\n"$pc"" > ~/.kemperSync/info
    chmod +x ~/.kemperSync/ssh_authorize.sh
    ~/.kemperSync/ssh_authorize.sh
    echo "Adding watch to bin\n"
    sudo cp ~/.kemperSync/watch /usr/local/bin/watch && chmod +x /usr/local/bin/watch
else
    ~/.kemperSync/ssh_authorize.sh
    echo ""$username"\n"$pc"" > ~/.kemperSync/info
fi
 









