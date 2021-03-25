# m300_lb

## Inhaltsverzeichnis
- [m300_lb](#m300_lb)
  - [Inhaltsverzeichnis](#inhaltsverzeichnis)
  - [1. Einführung](#1-einführung)
  - [1.1 Netzwerkplan](#11-netzwerkplan)
  - [9. Quellenangabe](#9-quellenangabe)

## 1. Einführung

Dieses Projekt wurde für die LB2 M300 entwickelt, mit dem Ziel eine Active Directory Testumgebung umzusetzen auf Basis von "Infrastructure as Code". 
Die Testumgebung setzt einen Domänencontroller mit DHCP Funktion auf und einen Testserver, welcher vom DHCP vom DC eine IP zugewiesen wird und dieser dann autmatisch der Domäne joint. 
Wir verwenden hierfür die Tools Vagrant und Virtualbox. 

## 1.1 Netzwerkplan
<p>
  <img width="650" src="Netzwerkplan/lb_netzwerkplan_V2.jpg">
</p>

## 9. Quellenangabe

Vagrant. Vagrant Dokumentation. URL: vagrantup.com/docs

SubPointSupport. Setup DC. URL: medium.com/subpointsolutions/building-a-disposable-windows-2016-domain-controller-in-20-minutes-with-vagrant-fce6eb4e01bd