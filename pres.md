---
author:
  - Bèr `berkes` Kessels
title: An Introduction to Rust
subtitle: "An Introduction to Rust for Run Rust Anywhere 30-08-2022"
abstract: "A very basic introduction to the Rust Programming Language. It will convince you to pick Rust for your future projects. And show how and where to start."
keywords:
  - rust
  - programming
  - introduction
title-slide-attributes:
    data-background-image: animated-ferris.gif
    data-background-size: contain
lang: en
---

# Rust {background-image="./animated-ferris.gif"}

## About

* Is online: [berk.es/rre-rust](https://berk.es/rre-rust) (github.com/berkes/rust-pres)
* Has all links
* Is in English

## About me {background-image="./ber.jpg"}

* Bèr `berkes` Kessels
* @berkes - Twitter, LinkedIn, Fediverse
* Works on Plannel, and freelancer (for hire!)
* Blogs on berk.es

## Goal

* Your next project in Rust?
* How do I get started with Rust?

# Why Rust

## Everything is C (somewhere)

> Software is eating the world
>
> -- Marc Andreessen

The world runs on C.

::: notes

Almost all software is written in C. Even Ruby, Python or C++
Firefox, Linux, OSX (Darwin), Windows.

:::

## Biggest flaw

> I call it my billion-dollar mistake…
>
> -- Tony Hoare, inventor of ALGOL W.

::: notes

C en C++ have some design-flaws:
Memory unsafety. Null-pointer, Stack Overflow, Data Races, SegFaults etc.

:::

## Memory safety

> Roughly 70% of all serious security bugs in the Chrome codebase are memory management and safety bugs
>
> --  Google engineers

::: notes

Linux, Windows, OpenSSL (heartbleed), Apache, LibreOffice, Android, iOS, OSX, en Firefox.

:::

## Mozilla

- 2010: Mozilla comes with [Project Servo](https://www.slideshare.net/BrendanEich/future-tense-7782010)
- Rust 1.0, first stable version: 15 May 2015.
- 2021 - Rust Foundation door "Big five"

> Rust is intended to be a language for highly concurrent and highly safe systems,
> 
>  -- Graydon Hoare inventor of Rust.

::: notes

Mozilla fired 250 of their 1000 employees in summer 2020, following COVID-lockdowns.
Servo-team was stopped. 
Mozilla essentially killed Rust.

8 February 2021, Rust Foundation was announced by five founding organisations:

- AWS
- Huawei
- Google
- Microsoft
- Mozilla.

:::

--- 

The problem to solve: [Memory Safety](https://hacks.mozilla.org/2019/01/fearless-security-memory-safety/)

::: notes

* Performance and Security

:::

## Everyone: Garbage collector

* Let the runtime (or VM) solve it.
* Slow! [Instagram: 10% performance gain by switching off the GC](https://instagram-engineering.com/dismissing-python-garbage-collection-at-instagram-4dca40b29172)
* Hard for Multithreading (GIL)

::: notes
* Who wants to know how GC works?
:::

## C en C++: DIY

> Rust Is the Industry’s ‘Best Chance’ at Safe Systems Programming
> -- [Microsoft](https://thenewstack.io/microsoft-rust-is-the-industrys-best-chance-at-safe-systems-programming/)

## Rust: Compiler to the rescue

* Borrow Checker
* Type Checker

## Borrow checker (ownership)

> Ownership is Rust’s most unique feature, and it enables Rust to make memory
> safety guarantees without needing a garbage collector.
> -- [The Rust Handbook](https://doc.rust-lang.org/book/ch04-00-understanding-ownership.html)

Compile-time

## Threading

[Fearless Concurrency](https://doc.rust-lang.org/book/ch16-00-concurrency.html)

> By leveraging ownership and type checking, many concurrency errors are compile-time errors in Rust rather than runtime errors.
> -- [The Rust Programming Language Handbook](https://doc.rust-lang.org/book/ch16-00-concurrency.html)

::: notes
* Borrow-checker happened to be an accidental solution
:::

## Who?

Android, Amazon, CloudFlare, Discord, Dropbox, ...

Microsoft, Google, IBM, Facebook, Huawei, Mozilla, Samsung, Kraken.

Signal, System76, Npm, Nextcloud, Fly.io.

# Why Rust for me (work smarter not harder) { background-image=smart.gif }

## What's important for me?

* Software should work for decades.
* The Proper Thing is the Default and The Easiest to do.
* Simpler (not easier): Maintainance, Hosting, Testing, Delivery.

## Good things

* Compiler forces you to think.
* Type checker, Borrow checker makes you a better developer.
* Brilliant Compiler Errors. Feels like a Peer Programmer.
* Built in testing, formatting, linting.
* Supereasy to deploy.
* If it compiles, it's done.
* Works today. Works in 10 years.

## Bad Things (for others) 

* Slow compiler
* LLVM (and not GCC)
* Big Binaries

## Bad Things (for me)

* Borrow- and Type checker slow me down.
* Decades of OOP to unlearn.
* The *huge* stdlib.
* Lots of tooling (and few apt-get-able)
* Giant build assets (Gigabytes of caches).

# Hello World { background-image=hello.gif }

## Hello World

```rust
fn main() {
    println!("Hello World!");
}
```

`rustc hello.rs`

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
* What's wrong here?

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
* Whats wrong here?

[Play](https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=719a66d4d0dabcaaecea6484bf89b223)

---

* Clone [Play](https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=9c066c8f27eaf558d0eb4afd394324c7)
* Reference [Play](https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=a13f5450049771869be55e2a9155af93)
* Return [Play](https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=4572a6f307d504c6d151306567868673)

## Hello Struct and Trait

```rust
pub trait Summary {
    fn summarize(&self) -> String;
}

pub struct NewsArticle {
    pub headline: String,
    pub location: String,
    pub author: String,
    pub content: String,
}

impl Summary for NewsArticle {
    fn summarize(&self) -> String {
        format!("{}, by {} ({})", self.headline, self.author, self.location)
    }
}

pub struct Tweet {
    pub username: String,
    pub content: String,
    pub reply: bool,
    pub retweet: bool,
}

impl Summary for Tweet {
    fn summarize(&self) -> String {
        format!("{}: {}", self.username, self.content)
    }
}

pub fn notify<T: Summary>(item: &T) {
    println!("Breaking news! {}", item.summarize());
}
```

[Play](https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=c794b6a63659e9c8d6314bd1a8779ccd)

::: notes
traits are like interfaces. 
`impl` allows adding functions and methods to structs.
:::

## <T: Summary>

* Structs for Data
* Traits for Behaviour
* Composition (and no inheritance)
* Types are enforced
* Ownership is enforced
* Good Defaults (private, immutable, etc)

# Getting Started { background-image=confused.gif }

## Tools

* rustc 
* cargo
* rustup (or `apt-get install rustc rust-all cargo`)
* fmt, test, clean, run, publish
* clippy, watch, wasm

## Resources

* [Rust Getting Started](https://www.rust-lang.org/learn/) - Book, Rustlings Course, Rust-by-example
* [Playground](https://play.rust-lang.org/)
* [The Cargo Book](https://doc.rust-lang.org/cargo/)
* [Commandline-, Webassembly-, Embedded book](https://www.rust-lang.org/learn/)
* [Awesome Rust List](https://github.com/rust-unofficial/awesome-rust#resources)
* [Rust Learning Wiki](https://github.com/ctjhoa/rust-learning)
* [Take Your First Steps With Rust (Microsoft)](https://docs.microsoft.com/en-us/learn/paths/rust-first-steps/)

* Udemy, Coursera, Egghead, Freecodecamp

# The End

## Questions?

![berk.es/rre-rust](./link_to_pres_as_qr.png)
