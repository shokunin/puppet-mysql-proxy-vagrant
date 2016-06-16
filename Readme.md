## mysql_proxy_tests


1) install virtual box > 5
2) install vagrant ~> 1.8.4
3) install vagrant plugin

```
vagrant plugin install vagrant-vbguest
```

4) install gems

```
bundle install
```

5) install puppet modules

```
cd puppet && r10k puppetfile install
```

6) start vagrant

```
vagrant up
```

7) connect via mysql

```
mysql -u myuser -pmypass -h 127.0.0.1 --port 3307
```
