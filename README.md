# Create Users Script

This script is designed to help you create new user accounts and groups. It can also create directories, assign ownership and permissions to those directories, and add users to groups.

### Usage

> bash

    create_users [-u|--username] n <username> [-s|--sector] n <sector name>

### Options

    -u | --username: Specifies the number of user accounts you want to create, followed by the usernames you want to use.
    -s | --sectors: Specifies the number of sectors/groups you want to create, followed by the sector/group names you want to use.

### What it does

   * Creates directories for each sector.
   * Creates groups with names starting with "grp_" for each sector.
   * Changes ownership of the directories to root and their respective groups.
   * Sets the directory permissions to 770 (read, write, and execute for owner and group).
   * Creates new users with the given usernames and adds them to the chosen group.

### Example

Here's an example command that creates two user accounts and two sectors/groups:

> bash

    ./create_users.sh -u 2 joao victor -s 2 sales marketing

This will create two user accounts with the usernames "joao" and "victor", and two sectors/groups named "sales" and "marketing".

### Notes

   * The password for each user is currently hardcoded in the script as "Senha123". You may want to change this for security reasons.
   * The script assumes that you are running it as the root user. If you are not, you may need to modify the ownership and permissions commands.
