# Scribe
A Simple to use CLI Password Manager written in Ruby. Passwords are encrypted in AES-256-CBC.

# Features
- Add Passwords!
- Import Passwords! 
- Export your passwords!
- Search by Site name to get passwords!
- Display when it was last modified!

# Usage
scribe [arg1 ... arg4]'
Args:'
add <site> <username> <password>      Add Site to Password Vault
get <site_name>                       Get Site info from Password Vault
import <file name>                    Import CSV file of passwords'
export                                Export CSV file of Password Vault
help                                  Display this help
about                                 Display about page

# Issues
- On OpenBSD, SQLite will show encoding warnings, most likely due to Pledge, warnings are suppressed until tweaked.

# Things that's being worked (AKA, I am tired, I want to sleep..)
- Adding more automation. That way it can be hosted on a server, and will grab it. Should be really easy.
- Make it packaged.
- Error handling.
- Count arguments.
- Make a vault for notes and files...?
- Sleeping.
