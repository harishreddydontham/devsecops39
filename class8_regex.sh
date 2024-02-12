#!/bin/bash
slack_web='https://hooks.slack.com/services/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'
if [ $# -gt 0 ]; then
    for user in $@; do
        #if [[ $user =~ ^[a-z][a-z][a-z][0-9][0-9][0-9]$ ]]; then --- starts with 3 alphabets and ends with 3 numbers
        #if [ $user =~ ^[a-z]+$] then - starts with alphabet and end with number
        if [ $user =~ ^[a-z]$ ]; then
            check_user=$(cat /etc/passwd | grep -w $user | cut -d ":" -f1)
            if [ "$user" = "$check_user" ]; then
                echo "The user already exists in the system"
            else
                echo "lets create a new user"
                sudo useradd -m $user --shell /bin/bash -d /home/$user
                sudo usermod -a -G root $user
                echo '${user} ALL=(ALL) NOPASSWD: ALL' >>/etc/sudoers
                spl=$(echo '!@#$%^&*()' | fold -w1 | shuf | head -1 | tail -1)
                password=$(echo India${spl}${RANDOM})
                echo "${user}:${password}" | sudo chpasswd
                passwd -e ${user}
                echo "The Credentials are username is : ${user}  andd the password : ${password}"
                curl -X POST ${slack_web} -sL -H 'Content-type: application/json' --data "{"text": \"Username is : ${user}\"}" >>/dev/null
                curl -X POST ${slack_web} -sL -H 'Content-type: application/json' --data "{"text": \"Password is : ${password} reset it immediately\"}" >>/dev/null
            fi

        else
            echo "you have to enter 3 alphabets and 3 numbers"
        fi

    done
else
    echo "Give atleast one parameter to create a user"
fi
