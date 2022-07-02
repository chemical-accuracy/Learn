# # inst - installer of stuff
# # usage: inst <file>
inst ()
{
if [ ! -f $1 ] ; then
	# search for a program like this in downloads
	for file in *${1}* ~/Downloads/*${1}* ; do
		program=$file
	done
	# add a question "Proceed?" and an option to say yes or no
	# add a way to choose what to install if multiple options found
else
	program=./$1
fi
case $program in
        *.sh)		sudo bash $program  ;;
        *.AppImage)	chmod u+x $program ; mv $program ~/Software/ ; cd ~/Software ; echo "AppImage is installed in the folder Software. Try running it with ./NAME"  ;;
        *.deb)		sudo apt install $program;;
        *.tar)		cd ${program%/*} ; ex $program ; program_name=${program##*/} ; cd ${program_name%.tar} ; echo "Upon extraction moved to folder" ; echo ${program_name%.tar} ; echo ; echo "Damping the contents of INSTALL" ; cat INSTALL ;;
        *.tar.*)	cd ${program%/*} ; ex $program ; program_name=${program##*/} ; cd ${program_name%.tar.*} ; echo "Upon extraction moved to folder" ; echo ${program_name%.tar.*} ; echo ;  echo "Damping the contents of INSTALL" ; cat INSTALL ;;
        *)           echo "'$program' cannot be installed via inst()" ;;
esac
}

