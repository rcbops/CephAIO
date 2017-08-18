
## Verify rgw setup

Using `swift-bennch` is an great way to verify the rgw setup
 * In the cephrgw container create necessary users
 * On the host pip install swift-bench and it's dependencies
 * Set up the key, bench.conf
 * run swift-bench

### Set user
SSH into a cephrgw node 
```
ssh cephrgw
```

Create the base user and disregard  the output:
```
radosgw-admin user create --uid="testuser" --display-name="Testy Tester"
```

Create the swift user and make note of the secret key
```
radosgw-admin subuser create --uid=testuser --subuser=testuser:swift --access=full
```

~~Sample Output:~~ You will use the secret key ` tB7PSrHReur10oUCiRcgYmXsqRMpPE3oemk5zdaheo ` to run swift-bench on the host
```
{
    ...
    "swift_keys": [
        {
            "user": "testuser:swift",
            "secret_key": "B7PSrHReur10oUCiRcgYmXsqRMpPE3oemk5zdahe"
        }
    ],
    ...
}
```

Install swift-bench and it's dependencies
```
sudo apt-get install python-setuptools
sudo easy_install pip
sudo pip install --upgrade setuptools
sudo pip install --upgrade swift-bench
```

Set the user key and run swift bench
```
cd tests
export SKEY=<swift_keys.secret_key>
swift-bench -K $SKEY bench.conf
```


