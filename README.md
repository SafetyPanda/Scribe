# Scribe
A Simple to use CLI Password Manager written in Ruby. Passwords are encrypted in AES-256-CBC.

# Features
- Add Passwords!
- Import Passwords!
- Delete Passwords!
- Export your passwords!
- Search by Site name to get passwords!
- Display when it was last modified!

# Usage
scribe [arg1 ... arg4]'
Args:'
add <site> <username> <password>         Add Site to Password Vault
get <site_name>                          Get Site info from Password Vault
auto-get <site> <encryption password>    For SSH commands, not recommended for regular use.
import <file name>                       Import CSV file of passwords'
export                                   Export CSV file of Password Vault
gen <num of characters>                  Generates a SecureRandom Base64 Password. Default 15.
help                                     Display this help
about                                    Display about page

# Issues
- On OpenBSD, SQLite will show encoding warnings, most likely due to Pledge, warnings are suppressed until tweaked.

# Things that's being worked (AKA, I am tired, I want to sleep..)
- Make it packaged.
- Updating Site passwords
- Sleeping.
