# Tampering with TrustedInstaller may break the operating system, you should know what you are doing when operating with TrustedInstaller

## Credits

This powershell script is heavily inspired by this [post](https://www.tiraniddo.dev/2017/08/the-art-of-becoming-trustedinstaller.html) by James Forshaw.  
I read this post after i watched [John Hammond's video](https://www.youtube.com/watch?v=Vj1uh89v-Sc) based on this post. (Post also linked in the description of the video.) This powershell script is also heavily based on this video.

## Note

- These scripts are not complete, but rather just for me to test around. These scripts are yet to be made "better"
- Note that the Test scripts may not work. They exist for education purposes. 

## How the script works

Runs current session with impersonation of TrustedInstaller process token

## How to run the script

To be able to run the script as intended (With starting service TrustedInstaller), you will need to navigate to the directory of the script, and run it from there in an Administrative powershell session.

- Run a new powershell session as Administrator

- Use ``` cd /path/to/script/directory``` to navigate to the directory

- Run the script by doing ``` ./RunPowershellSessionTrustedInstaller.ps1``` 

