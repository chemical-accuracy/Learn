# Repurposes rm command to only move files to another location (akin to bin). This makes it easy to restore files. Note: command needs to be modified/adapted if you have multiple disks (partitions) as mv will be slow in that case

# You can put the alias and function definition into your bashrc
alias rm=rubbish
rubbish()
{
        time=`date +%b%d%H%M`
        mkdir ~/.rubbish/$time
        mv $@ ~/.rubbish/$time
}


