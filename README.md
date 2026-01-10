# Dotfiles (chezmoi + age)

This repository manages my dotfiles using **chezmoi** with **age-based encryption**.

The goal is simple:
- reproducible setups
- minimal bootstrap friction
- no copying of secret keys between machines
- explicit, deliberate trust of new machines

This repo is/will be designed to work across laptops, servers, and rebuilds without leaking secrets.

---

## Why chezmoi

chezmoi is used because it cleanly separates:
- **state** (what my system should look like)
- **identity** (which machine is allowed to decrypt secrets)
- **bootstrap** (how a new machine joins)

Some ideas behind this setup is explained very well in:

👉 https://marcusb.org/posts/2025/01/frictionless-dotfile-management-with-chezmoi/#whychezmoi

The important takeaway is:

> A machine proves its identity first.  
> Trust is granted later.

---

## Encryption model

- All secrets are encrypted using **age**
- Each machine has its **own age key**
- Private keys never leave the machine
- The repository is encrypted to a set of **approved recipients**

If a machine’s public key is not listed as a recipient, it cannot decrypt secrets.  
---

## Bootstrap flow (high level)

1. A new machine generates its own age key
2. Work in progress

