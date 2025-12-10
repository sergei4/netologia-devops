# Домашнее задание к занятию 5 «Тестирование roles»

## Molecule

![alt text](image.png)

## Tox

![alt text](image-2.png)
![alt text](image-3.png)

tox-requirements.txt
```
selinux
lxml
molecule==3.6.1
molecule_podman
jmespath
```

tox.ini
```
[tox]
minversion = 1.8
basepython = python3.6
envlist = py{37,38,39}-ansible{210,30}
#envlist = py{37,38}-ansible{210}
skipsdist = true

[testenv]
passenv = *
deps =
    -r tox-requirements.txt
    ansible210: ansible<3
    py38: ansible-compat==2.2.0
    py39: ansible-compat==2.2.0
    ansible30: ansible<3.1
commands =
    {posargs:molecule test -s compatibility --destroy always}
```
![alt text](image-4.png)    