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
background-image: back.svg
title-slide-attributes:
    data-background-image: animated-ferris.gif
    data-background-size: contain
lang: nl
---

# Rust {background-image="./animated-ferris.gif"}

## Over deze presentatie

* Is online: [berk.es/rust-pres](https://berk.es/rust-pres) (github.com/berkes/rust-pres)
* Bevat alle links, klikbaar
* Enige kennis van automatisering of programmeren is mooi
* Is in het Nederlands

## Over mij {background-image="./ber.jpg"}

* Bèr `berkes` Kessels
* @berkes
* Werkt aan Plannel
* Blog berk.es
* Mail ber@berk.es

## Doel

* Je volgend project(je) in Rust?
* Hoe begin ik met Rust? 
* Wanneer er interesse en tijd is, zullen we dieper in een voorbeeld duiken.

# Waarom Rust

## Alles is C

> Software is eating the world
>
> -- Marc Andreessen

De wereld, anno 2022, draait op C.

::: notes

Bijna alle software is (uiteindelijk) in C geschreven. C++, C zelf, PHP,
Python, Firefox, Linux, OSX (darwin), Windows.

:::

## De grote ontwerpfout

> I call it my billion-dollar mistake…
>
> -- Tony Hoare, inventor of ALGOL W.

::: notes

C en C++ bevatten enkele, achteraf, kritische ontwerpfouten
Memory unsafety. Null-pointer, Stack Overflow, Data Races, SegFaults etc.

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

--- 

Op te lossen probleem: [Memory Safety](https://hacks.mozilla.org/2019/01/fearless-security-memory-safety/)

::: notes

* Performance en Security
* Pointers, addresses etc.
* Lijst met 11 mensen -> Geef aan Peter om te sorteren en aan Oscar om "niet betaald" eruit te halen.
* Wat als Oscar er twee uithaalt. En Peter ze nog aan het sorteren is?

:::

## Iedereen: Garbage Collector

* Laat de Runtime het oplossen:
* `String greeting = "Hello";`
* Heap? Stack? Gebruikt? Vrijgeven?
* Traag! [Instagram: 10% performancewinst door uitzetten van de GC](https://instagram-engineering.com/dismissing-python-garbage-collection-at-instagram-4dca40b29172)
* Locking - Threads

::: notes
* Stop! Alles.
* Wat kunnen we opschonen? 
* Verwijder dit.
* Geef geheugen vrij.
:::

## C en C++: DIY

> Rust Is the Industry’s ‘Best Chance’ at Safe Systems Programming
> -- [Microsoft](https://thenewstack.io/microsoft-rust-is-the-industrys-best-chance-at-safe-systems-programming/)

## Rust: Borrow checker (ownership)

> Ownership is Rust’s most unique feature, and it enables Rust to make memory
> safety guarantees without needing a garbage collector.
> -- [The Rust Handbook](https://doc.rust-lang.org/book/ch04-00-understanding-ownership.html)

::: notes

* Performance en Security
* Pointers, addresses etc.
* Lijst met 11 mensen -> Geef aan Oscar om te filteren en **daarna door** aan Peter om te sorteren.
* Wat als Oscar nummer 6 verwijdert? En Peter daarna bij 6 aanbeland tijdens het sorteren?

:::

## Threading

[Fearless Concurrency](https://doc.rust-lang.org/book/ch16-00-concurrency.html)

> By leveraging ownership and type checking, many concurrency errors are compile-time errors in Rust rather than runtime errors.
> -- [The Rust Programming Lanuage Handbook](https://doc.rust-lang.org/book/ch16-00-concurrency.html)

::: notes
* Lijst met 11 mensen -> Geef aan Oscar om we filteren en **tegelijk** aan Peter om te sorteren.
* Borrow-checker kan dit ook oplossen!
:::

## Who?

Android, Amazon, Cloudflare, Discord, Dropbox, ...

Microsoft, Google, IBM, Facebook, Huawei, Mozilla, Samsung, Kraken.

Signal, System76, Npm, Nextcloud, Fly.io.

# Hello World { background-image=hello.gif }

## Hello World

```rust
fn main() {
    println!("Hello World!");
}
```
[Play](https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=1ec91939ba95a128f295bfa0fba22fde)

## Hello Functions

```rust
fn main() {
    println!("Hello {}!", "Moon");
    greet("Mars");
}

fn greet(name: &str) {
    println!("Hello {}!", name);
}

```
[Play](https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=aee43ac97b5165cee53a72d8559c409e)

## Hello Types
```rust
fn main() {
    let name = format!("{} {}", "Bèr", "Kessels");
    greet(name);
    greet(42);
}

fn greet(name: String) {
    println!("Hello {}!", name);
}
```
* Wat gaat hier fout?

[Play](https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=960875932d9d4c2179f65c8b065dcdd9)

## Hello Borrow Checker

```rust
fn main() {
    let name = format!("{} {}", "Bèr", "Kessels");
    greet(name);
    println!("Goodbye, {}", name);
}

fn greet(name: String) {
    println!("Hello {}!", name);
}
```

* Wat gaat hier fout?

[Play](https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=719a66d4d0dabcaaecea6484bf89b223)

---
* Clone [Play](https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=9c066c8f27eaf558d0eb4afd394324c7)
* Reference [Play](https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=a13f5450049771869be55e2a9155af93)
* Return [Play](https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=4572a6f307d504c6d151306567868673)

# Getting Started { background-image=confused.gif }

## Tools

* rustup (of `apt-get install rustc rust-all`)
* rustc 
* cargo (of `apt-get install cargo`)
* clippy, fmt, wasm, test, clean, publish, watch, run

## Resources

* [Rust Getting Started](https://www.rust-lang.org/learn/) - Book, Rustlings Course, Rust-by-example
* [Playground](https://play.rust-lang.org/)
* [The Cargo Book](https://doc.rust-lang.org/cargo/)
* [Commandline-, Webassembly-, Embedded book](https://www.rust-lang.org/learn/)
* [Awesome Rust](https://github.com/rust-unofficial/awesome-rust#resources)
* [Rust Learning](https://github.com/ctjhoa/rust-learning)
* [Take Your First Steps With Rust](https://docs.microsoft.com/en-us/learn/paths/rust-first-steps/)

* Udemy, Coursera, Freecodecamp

# Deep Dive { background-image=dive.gif }

## Duik in een voorbeeld

* Commandline Tool: [Blek](https://github.com/berkes/blek)
* Webservice: [Spicy Scarlet Slug](https://github.com/berkes/spicy-scarlet-slug)
* Bot: [Hunter2](https://github.com/Flockingbird/hunter2)
* WASM: [WASM-Game-of-life](https://github.com/berkes/wasm-game-of-life)
* Game Dev: ?
* GUI Dev: ?
