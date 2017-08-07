# KemperSync
Helps sync your local file with the SSIF Desktops

### Setup 
1. You will need to have a SSH private/public key pair 
(this allows to log on to the CSIF machine without having to type in the password everytime)
More info: https://tinyurl.com/jszhyld

    1.5 To generate one:

    ```
    ssh-keygen -t rsa -C "your_email@example.com"
    ```

2. Running Automatic Setup script
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/JohnlNguyen/KemperSync/master/setup.sh)"
```

### Usage 

You can sync your local directory or file with, remote location will be at root ~

```
watch <local> 
```

Optionally, you can specify the remote path you wish to sync the file with. However the directory / file have already existed there on your remote computer

```
watch <local> <remote> 
```

To change username or pc number 

```
watch setup
```

***Only works on OSX***
