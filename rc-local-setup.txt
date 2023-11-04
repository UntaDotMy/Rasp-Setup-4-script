## THIS FOR ENABLE RC-LOCAL 

1. Create a new file named rc.local in the /etc directory with the following content:

```bash
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

# Add your commands here

exit 0
```

2. Set the permissions of the file to make it executable:

```bash
chmod +x /etc/rc.local
```

3. Enable the service to start during boot:

```bash
systemctl enable rc-local
```

4. Restart the system or start the service manually:

```bash
systemctl start rc-local
```

5. Check the status of the service:

```bash
systemctl status rc-local
```
