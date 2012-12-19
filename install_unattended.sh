#!/bin/bash

# Go trough all the files available in this folder.
commonFiles=();
for sourceFile in .*; do

	# Exclude some files.
	if [[ "$sourceFile" == "install_unattended.sh" || "$sourceFile" == "install.sh" ]] || [[ "$sourceFile" == "README.md" ]] || [[ "$sourceFile" == "." ]] || [[ "$sourceFile" == ".." ]] || [[ "$sourceFile" == ".git" ]]; then
		continue;
	fi;

	# Set the target path for the source file.
	# We'll port them to the ~/ (home) directory.
	targetFile="$HOME/$sourceFile";

	# The file already exists.
	if [ -e "$targetFile" ]; then

		# The source and target point to the same file, continue.
		[ "$sourceFile" -ef "$targetFile" ] && continue;

		# The content of the file is the same, continue.
		diff -rq "$sourceFile" "$targetFile" > /dev/null 2>&1 && continue;

		# The source file is another file than our dotfile.
		# Store it in the commonFiles array so we can back it up.
		commonFiles+=("$sourceFile");

	fi;
done;

# Show the files that will be overwritten.
conflictCount=${#commonFiles[@]};

# Create a suffix with a timestamp so the user can see which
# files and when they've been backupped.
backupSuffix=".jsVimconfig-$(date +'%Y%m%d-%H%M%S')";

# Rename the conflicting files as backup.
for sourceFile in "${commonFiles[@]}"; do
	targetFile="$HOME/$sourceFile";
	mv -v "$targetFile" "$targetFile$backupSuffix";
done;

# Symlink the files in the home dir by those in the dotfiles repo.
for sourceFile in .*; do

	# Exclude some files.
	if [[ "$sourceFile" == "install_unattended.sh" || "$sourceFile" == "install.sh" ]] || [[ "$sourceFile" == "README.md" ]] || [[ "$sourceFile" == "." ]] || [[ "$sourceFile" == ".." ]] || [[ "$sourceFile" == ".git" ]]; then
		continue;
	fi;

	targetFile="$HOME/$sourceFile";

	# Delete the old file and replace it by the symlink.
	rm -rf "$targetFile" &&
	ln -vs "$PWD/$sourceFile" "$targetFile";
done;

# This will add a tag to our prompt, so we know which environment we're in.
# It is adaptable in ~/.bash_environment
touch ~/.bash_environment;
echo -e "export __prompt_environment='[DEVELOPMENT] '" | tee ~/.bash_environment > /dev/null;
