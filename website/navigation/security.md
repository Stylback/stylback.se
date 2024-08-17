---
permalink: /security/
title: Security
layout: default
---

# Security Policy
This page outlines the security policy for `www.stylback.se`. It contains a vulnerability disclosure policy, contact information and acknowledgements.

## Vulnerability Disclosure Policy
This section outlines how to conduct a responisble vulnerability disclosure. It describes the usual steps that you might yourself take aswell as what steps I myself usually take.

### I believe I've found a vulnerability
First; thank you for taking the time to look up this policy page.
Second; **please contact me with details on the vulnerability and what you believe could be done to mitigate it**.

Once I've received your message, I will take a few days to verify and understand the vulnerability. During this time I might also have to conduct triage or implement temporary safeguards, depending on how serious the vulnerability is. I will then write back to you to acknowledge I've received the message and what I plan to do next.

I make every effort to resolve vulnerabilities, assuming they are within my power to resolve. If I believe the vulnerability is outside my area of control, I will thank you for the disclosure and try my best to point you to others that are in a position to resolve it (if applicable).

Once this process of vulnerability disclosure is deemed complete, I will offer you my thanks and a spot in the Acknowledgement section.

### I would like to poke around for vulnerabilities, is that OK?
Yes, I do however ask three things of you:

1. That you act in good faith.
2. That you do not use methods that harm, damage, or disrupts my services nor use methods that are illegal. An example of methods included in this category are DoS/DDoS-ing my server, trying to phish me for credentials or physically breaking into my home.
3. That if you do find a vulnerability, you follow the instructions outlined in the "*I believe I've found a vulnerability*"-section above.

### I might've broken something, am I in trouble?
If you complied with the three conditions outlined in the previous section, you can rest assured that you are not in trouble. Accidents happens and are a part of the learning process. **I would rather that you accidentally break things in good faith today than having someone else purposely breaking them in bad faith tomorrow**. If something were to happen, I urge you to contact me in a similar way to what is described in the "*I believe I've found a vulnerability*"-section above.

### I have concerns or questions with regards to this policy
I would love to hear it, please send me an email and we can take it from there.

## Contact information
You can reach me at [jonas@stylback.se](mailto:jonas@stylback.se).

If you need to contact me with especially sensitive information, please encrypt your message with PGP. Here is a `bash` command to import my public PGP key, assuming you have `curl` and `gpg` on your system:

```bash
curl https://www.stylback.se/key.asc | gpg --import
```

## Acknowledgements
This section is to thank individuals that have made a responsible vulnerability disclosure which have resulted in security improvements on this website.

|  Thank you!   |
| --- |
|  John doe (john@doe.com) <br> John helped me with ... you can read more about John's work at ... |
