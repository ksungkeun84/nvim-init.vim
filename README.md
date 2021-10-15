
## Setup dev-env
Run the setup.py

```console
username@xxx: python setup.py
```

## Setup Nvim in dev-env docker

```console
(host) username@xxx: ./docker-run.sh
(docker) username@xxx: vi
(command mode in vi) :PlugInstall
```

## Initialize anaconda in dev-env docker

```console
(docker) username@xxx: conda init bash
(docker) username@xxx: exit
(host)   username@xxx: ./docker-run.sh
(docker) username@xxx: conda activate gem5 
(gem5)   username@xxx:
```
