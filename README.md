# Stress a MISP instance

This will only work on Ubuntu 18.04

No other support is planned.

# Requirements

* A MISP install. Ideally as directed in the [documentation](https://misp.github.io/MISP/INSTALL.ubuntu1804/) or installed via the [installer](https://github.com/MISP/MISP/blob/2.4/INSTALL/INSTALL.sh)
* Minimum MISP version 2.4.109
* pyMISP
* bash
* jq
* pipfile
* python 3.7

# What does it do?

It will try and stress your MISP Instance by:

- Creating thousands of events (in paralell)
- Create events with thousands of attributes
- Create thousands of Organisations
- Create thousands of Users
- Delete Orgs/Users/Events/Attributes

# Usage

```bash
wget --no-cache -O /tmp/stress.sh https://raw.githubusercontent.com/SteveClement/misp-stress/master/stress.sh ; bash /tmp/stress.sh
```

This will bootstrap the entire stress suite into /tmp and clean itself up once done.


# License

<img src="https://nonwhiteheterosexualmalelicense.org/502px-Asexual_symbol.svg.png" data-canonical-src="https://nonwhiteheterosexualmalelicense.org/502px-Asexual_symbol.svg.png" width="12" height="12" /> [NWHM](https://nonwhiteheterosexualmalelicense.org/) Licensed
