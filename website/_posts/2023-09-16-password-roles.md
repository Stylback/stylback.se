---
title: The Role of Passwords
categories: cybersecurity
updated: 2024-03-21
layout: post
---

Passwords as we know them today have been around since [1961](https://en.wikipedia.org/wiki/Compatible_Time-Sharing_System#Features). Almost all digitial services and systems have some form of built-in authentication and most of them will utilize the combination of usernames and passwords to verify access to said service or system.

Despite the introduction of the internet and the rise of cybercrime, the way we think about passwords have not changed much. At its core, passwords are supposed to be secret and must therefore be commited to memeory by an individual or a small group of individuals. A password that is easy to remember tend to be easy to guess, creating a security risk. On the other hand, a password that is hard to guess also tends to be hard to remember, creating frustration among it's users. When users are frustrated they take shortcuts, creating further risks.

In this article I will touch on four areas with regards to passwords in an effort to highlight the need to reevaluate the way we think about and use them. These areas are how we estimate the strength of a password, how outdated password policies have become a security risk, how attackers exploit the fundamental problems of passwords and some suggestions on what might be done about it.

## What is a "strong" password?
A common way for organizations and businesses to estimate the strength of a password is to calculate how much "entropy" a password exhibits. It's usually done with a simple mathematical function:

*E = log<sub>2</sub> S<sup>L</sup>*

Where **E** is the number of bits of entropy, **S** is the symbol pool and **L** is the password length. Think of the symbol pool as the number of possible characters that can be exhibited by a certain type of password. If a password only consist of numbers, it has a symbol pool of 10 (0-9). If a password consist of both lowercase and uppercase letters, the symbol pool is 52 (26+26, assuming a standard english alphabet). With this in mind, let us take a look at the estimated strength of 6 different passwords:

| Password | Symbol pool | Length | Bits of entropy |
| --- | --- | --- | --- |
| `123456` | 10 | 6 | `19.9` |
| `qwerty` | 26 | 6 | `28.2` |
| `Iloveyou` | 52 | 8 | `45.6` |
| `Password1!` | 94 | 10 | `65.5` |
| `15KM}=7pfBcl8(EcbT<GuQuJ\_(;P$` | 94 | 30 | `196.7` |
| `bounce undiluted slab walrus siberian` | 26 | 36 | `169.2`\* |

_\*In reality much lower, keep reading._

The first 4 passwords comes directly from a [list of most common passwords](https://en.wikipedia.org/wiki/List_of_the_most_common_passwords), the fifth is a randomly generated password and the last one is a randomly generated 5-word passphrase. As can be seen in the table, bits of entropy increases with the symbol pool and **sharply** increases with password length.

Passwords that are short and easy to remember can be expected to have low complexity and entropy. Passwords that are long and complex can be expected to have high entropy but hard to remember. One notable exception in our estimation are passphrases, which exhibits high entropy due to its length while remaining easy to remember.

**However**, this is quite a limited way of thinking about and estimating password strength. It's mostly used to estimate resiliency of a password against non-dictionary brute-force attacks, something we will touch on in an upcoming section. It does not take into account how easy a password is to guess nor does it distinguish between the possible symbol pool and the actual symbol pool. If you're interested and want to learn more about how to properly estimate password strength, take a look at [this](https://en.wikipedia.org/wiki/Password_strength) and [this](https://en.wikipedia.org/wiki/Entropy_%28information_theory%29 "https://en.wikipedia.org/wiki/Entropy_(information_theory)") article.

## Why do password requirements look so similar?
Back in 2004, the National Institute of Standards and Technology (NIST) [released a document](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-63ver1.0.1.pdf) to provide guidance for federal agencies on the implementation of electronic authentication. This guidance would differ depending on the authentication "level". Four of these levels were defined and ranked depending on the consequences as a result of errors and missuse, with Level 1 being the least serious and Level 4 the most serious. As an example that would satisfy the guidelines for a "Level 2" authentication, the document outlined a system that:

> - Use a minimum of 8 character passwords, selected by subscribers from an alphabet of 94 printable characters.
> - Requires subscribers to include at least one upper case letter, one lower case letter, one number and one special character.
> - Use a dictionary to prevent subscribers from including common words and prevented permutations of the username as a password.
> 
> \[...\] requires passwords to be changed every two years and limited trials by locking an account for 24 hours after 6 successive failed authentication attempts.

Following its publication, organizations and businesses globally would come to adopt parts of this instructional example in their own password policies. As an end-user, you might be familiar with the following set of requirements:

> Your password must contain:
> 
> - Minimum 8 characters
> - Minimum one uppercase letter
> - Minimum one number
> - Minimum one special character

In addition, it is commonplace for organizations and businesses to force a password-reset at regular intervals such as every 6, 12 or 24 months. While perhaps sufficient for the security landscape in 2004, these requirements have long since been considered obsolete. So much so that in 2017, NIST released a [revised document](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-63b.pdf) in an effort to foster better password practices. Despite NISTs efforts, many organizations have yet to update their policies to follow current best practices.

## How do attackers guess passwords?
It is not too far fetched to imagine that using similiar password requirements across organizations and countires for decades would result in similar looking passwords. As such, if you're an attacker trying to access a system, why not try usernames and password you already **know** people use? This is called a **dictionary attack**.

Through the years, passwords from previous attacks and data breaches have been collected and analyzed in an effort to find out which are more common than others. These lists are then used by both malicious actors (such as criminals) and security professionals (such as penetration testers) alike to assess the security of systems. For example, here is a list of the 10 most common passwords in the world according to [NordPass](https://nordpass.com/most-common-passwords-list/):

|  Rank   |  Password   |
| --- | --- |
|  1   |  `password`   |
|  2   |  `123456`   |
|  3   |  `123456789`   |
|  4   |  `guest`   |
|  5   |  `qwerty`   |
|  6   |  `12345678`   |
|  7   |  `111111`   |
|  8   |  `12345`   |
|  9   |  `col123456`   |
|  10   |   `123123`  |

Lists like this one can also be found for specific systems. As an example, [here](https://github.com/rapid7/metasploit-framework/blob/master/data/wordlists/mirai_user_pass.txt) is a list of common usernames and passwords for IoT-devices (such as internet-connected security cameras) which was used by the [Mirai](https://en.wikipedia.org/wiki/Mirai_(malware)) botnet. With lists like these, a dictionary attack is easily automated with software such as [Hydra](https://github.com/vanhauser-thc/thc-hydra) and [Crowbar](https://github.com/galkan/crowbar).

In those cases where common usernames and passwords are not enough, an attacker could extend their dictionaries by using information about the target. Personal information, names of family members, important dates and just regular words in their native language can all be used to increase the chances of success at the cost of computational time.

Dictionary attacks are also a way to defeat passphrases. If you're otherwise unable to gain access to a system and you know it allows passphrases, why not just try all possible combinations of a number of english words? If we assume that there are 30.000\* words in our symbol pool, that would gives us `44.6` bits of entropy for a 3 word passphrase and `74.4` bits for a 5 word passphrase. While still taking a significant amount of time to brute-force, it's not as dauntning a task as our previous `169.2`-bit estimation. 

_\*Note that a symbol pool of 30.000 is to be expected only when generating random passphrases via software, our symbol pool decreases significantly if we make passphrases by hand as we tend to use words more common to our language._

## What can be done?
So now we must ask ourselves; **do bad password habits stem from the lazyness of the individual and their unwillingness to "do better"?** I think that would be doing us all a disservice. I would argue that password habits exhibited by users, both in private and within organizations, are the result of years and years of outdated password policies pushed by organizations and businesses that knew no better.

By forcing arbitrary complexity on users while at the same time undermining their efforts by mandating regular password changes, organizations and businesses have collectively created the password landscape we see today. After all, why bother putting in the effort to create a password that is unique, long, complex and rememberable all at the same time, if you're forced to make a new password anually? It's no wonder that users would pick easily guessed passwords, re-use a previous password or write it down on a post-it note and stick it to their monitor.

The next question is; **what can be done?** As we're nearing the end of this article I want to leave you with some suggestions:

**As an individual**, I urge you to look into two staples of making your accounts more secure; [password managers](https://en.wikipedia.org/wiki/Password_manager) and [multi-factor authentication (MFA)](https://en.wikipedia.org/wiki/Multi-factor_authentication). A password manager creates and remembers long and complex passwords for you, while you only have to remember one single "master password" to access them. A good place to get started using a password manager is [Bitwarden](https://bitwarden.com/). MFA is the principle of presenting two or more pieces of information from different "mediums" to verify yourself, such as providing both your password and a code sent to your phone. Most major web services, such as Facebook and Amazon, support MFA and can usually be enabled in your account settings.

**As an employee**, you can ask that your workplace revise its password policy to allow yourself and your colleagues to use tools that increases security for all. Hardware-based authentication with a keycard or devices such as those made by [Yubico](https://www.yubico.com/) are well fitted for companies and organizations at a marginal cost (compared to getting breeched and seeing your stock price drop, among other unpleasant and expensive things).

**As a decision maker**, you can better the security posture of your organization by keeping up to date with best practises. This isn't something new, but it's always worth reminding yourself of. Lead by example, make security a priority throughout the organization in both action and word. If security is not part of the organizational culture, efforts to increase it's security posture will fall flat. As noted by Peter Drucker:
> *"Culture eats strategy for breakfast."*