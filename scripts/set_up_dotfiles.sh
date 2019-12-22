# this gets a list of all dotfiles in the dotfiles folder, and
# adds them to a temporary file, so we can work with them
dotfiles_folder="../dotfiles"
get_only_dotfiles="/.??*"
ls $dotfiles_folder$get_only_dotfiles  > ./dotfiles_list.txt


# now read that file line by line, and copy it's contents and paste them
# on the apropriate file (~/.<dotfile_name>)
while read dotfile_name; do
  # get the name of the dotfile without the "../dotfiles/" prefix
  clean_name=`basename $dotfile_name`
  
  # copy content from dotfile and write it into ~/<dotfile_name>
  echo "`cat $dotfiles_folder/$clean_name`" > ~/$clean_name
done < dotfiles_list.txt

# remove temporary dotfile list file
rm ./dotfiles_list.txt