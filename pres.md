---
author:
  - Bèr `berkes` Kessels
title: Introductie Rust
subtitle: "Rust: een moderne programmeertaal door Mozilla"
abstract: ""
keywords:
  - rust
  - programming
  - introductie
lang: nl
---

# Rust

## Over deze presentatie

* Is online: [berk.es/rust-pres](https://berk.es/rust-pres) (github.com/berkes/rust-pres)
* Bevat alle links, klikbaar
* Enige kennis van automatisering of programmeren is mooi
* Is in het Nederlands

## Over mij

* Bèr `berkes` Kessels
* @berkes
* Werkt aan Plannel
* Blog berk.es
* Mail ber@berk.es

## Doel

* Jullie schrijven een volgend project(je) in Rust.
* Hoe begin ik met Rust? 
* Wanneer er interesse en tijd is, zullen we dieper in een voorbeeld duiken.

# Waarom Rust

## Alles is C

> Software is eating the world
>
> - Marc Andreessen

De wereld, anno 2022, draait op C.

::: notes

Bijna alle software is (uiteindelijk) in C geschreven. C++, C zelf, PHP,
Python, Firefox, Linux, OSX (darwin), Windows.

:::

## De grote ontwerpfout

> I call it my billion-dollar mistake…
> - Tony Hoare, inventor of ALGOL W.

::: notes

C en C++ bevatten enkele, achteraf, kritische ontwerpfouten
Memory unsafety. Null-pointer, Stack Overflow, Data Races, etc.

:::

## Memory safety

> Roughly 70% of all serious security bugs in the Chrome codebase are memory management and safety bugs
>
> --  Google engineers

::: notes

Geldt ook voor Linux, Windows, Openssl (heartbleed), Apache, Libreoffice, Android, iOS, OSX, en Firefox.

:::

## Mozilla

- 2010: Mozilla komt met [Project Servo](https://www.slideshare.net/BrendanEich/future-tense-7782010)
- Rust 1.0, eerste stabiele versie: op 15 mei 2015 gelanceerd.
- 2021 - Rust Foundation door "Big five"

> Rust is intended to be a language for highly concurrent and highly safe systems,
> 
>  -- Graydon Hoare inventor of Rust.

::: notes

Mozilla ontsloeg 250 van haar 1000 werknemers in zomer 2020, n.a.v. COVID-19
pandemie. Servo-team werd gestopt. Mozilla trok hiermee praktisch de stekker
uit Rust.

Een externe foundation werd opgericht. En op 8 februari 2021, werd de Rust
Foundation aangekondigd door de vijf founding bedrijven:

- AWS
- Huawei
- Google
- Microsoft
- Mozilla.

:::
