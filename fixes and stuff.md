# Random stuff i had problems with and how i fixed it

## Oh-My-Zsh insecure completion-dependent

if you find something like:
```
[oh-my-zsh] Insecure completion-dependent directories detected:
drwxrwxrwx 1 <user> <user> 4096 Dec 20 19:36 <folder>
```

the fix i found is to run 

```
chmod 755 <folder>
```
[source](https://github.com/ohmyzsh/ohmyzsh/issues/6835)

## fucking randomly not having bash/zsh anymore
If you find that WSL suddenly stopped working, those following steps seem to have worked out for me:

  1. Run windows + R
  2. type SystemPropertiesAdvanced
  3. click settings in performance group
  4. In advanced tab, click Change under Virtual Memory and deselect the automatically manage paging file size for all drives
  5. Select custom size and enter 800 for initial size, 1024 for maximum size.
  6. Apply changes and restart.

[source1](https://superuser.com/questions/1275505/wsl-bash-doesnt-start)
[source2](https://github.com/Microsoft/WSL/issues/849)

## compdef: unkown command or service: <command>
I got the following error message when running `source ~/.zshrc`:

```
compdef: unknown command or service: rails
```

and this fix worked for me (though it seems like it doesnt work for everyone):

```
rm -f ~/.zcompdump*; compinit
```

[source](https://github.com/ohmyzsh/ohmyzsh/issues/2337)