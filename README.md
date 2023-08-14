# Static webpage from scratch

A repository to house my website, [stylback.se](https://www.stylback.se). It's a static website built from scratch using HTML and CSS with Front Matter and Liquid Templates to streamline deployment.

It is served using Jekyll, an open-source static website generator and server. Jekyll is running in a Docker container on a private server, a project you can read more about [here](https://github.com/Stylback/home-server).

## Getting started with Jekyll

I've written a [step-by-step post](https://www.stylback.se/) on how to get started with Jekyll, assuming you want to host it yourself. I've also added a section on how to add hotlink protection and restrict visitor access to certain directories.

## Further configuration

Once you have your static website up and running with Jekyll you might want to do some further configurations, below are some suggestions.

### robots.txt

From [Wikipedia](https://en.wikipedia.org/wiki/Robots.txt):

>robots.txt is the filename used for implementing the Robots Exclusion Protocol, a standard used by websites to indicate to visiting web crawlers and other web robots which portions of the website they are allowed to visit.
>
>This relies on voluntary compliance. Not all robots comply with the standard; email harvesters, spambots, malware and robots that scan for security vulnerabilities may even start with the portions of the website where they have been told to stay out.

Even though some bots might not comply, larger ones such as `GoogleBot` will. As such I believe it's worth implementing.

To get started, create a textfile named `robots.txt` in your websites **root** directory. That is, the directory that is at the highest level of your website, usually `/`. Inside the file you can specify what bots, if any, are allowed and where. The syntax is as follows:

```
User-agent: {* OR a string}
{Allow OR Disallow}: {empty OR a directory path}
```

For example, if you want to disallow `GoogleBot` from accessing your contacts page you might do something like this:

```
User-agent: GoogleBot
Disallow: /contact/
```

If you want to disallow all bots everywhere you can use:

```
User-agent: *
Disallow: /
```

For further syntax, see [this](https://developers.google.com/search/docs/crawling-indexing/robots/create-robots-txt) Google Developers article. A list of common user-agents can be found [here](https://user-agents.net/bots). You can also inspect other websites `robots.txt` for inspiration, such as [Wikipedia's](https://en.wikipedia.org/robots.txt).

Note that while `robots.txt` can prevent bots from indexing the content of a page, **it does not prevent it from appearing in search results**.
If you want to send a signal to a search engine that you don't want a page to appear in search results, use the `robots` HTML meta-tag on your pages:

```html
<meta name="robots" content="noindex">
```

More on it [here](https://developers.google.com/search/docs/crawling-indexing/robots-meta-tag).

### Refuse service

It's possible to refuse serving content to a known bad actor. If you have their user-agent, you can add a Nginx rule to silently drop the connection:

```
if ($http_user_agent ~* (agent1|agent2|agent3)){
    return 444;
}
```

If any of the three user-agents try to connect they will be met with:
`Secure connection could not be established.`.

### Syntax highlighting

Ever looked at a website and seen a colorful block of code with syntax highlighting? Ever wondered how they do that?
The answer is quite simple; it's just a stylesheet written in CSS, the hard part is implementing the language-specific CSS-classes.
Once again our life have been made easier by Jekyll, there is both a number of stylesheets to choose from and built-in functionality to correctly implement the classes for us.

First, browse the [list of officially supported stylesheets](https://jwarby.github.io/jekyll-pygments-themes/languages/javascript.html), pick one out, download and place it in `/assets/css/`.

Next, add the following line at the bottom of your styles.scss:

```css
@import "<stylesheet-name>.css";
```

Save. Finally, open your `_config.yml` file and add the line:

```yml
highlighter: rouge
```

Save, restart Jekyll. That's it! Assuming you're using Markdown to author your posts, specify the language of a code-block like so:

````
```python
list = ['hello', 'there']

# run a loop for each item of the list
for item in list:
    print(item)
```
````

Which will render as:

```python
list = ['hello', 'there']

# run a loop for each item of the list
for item in list:
    print(item)
```

### security.txt

A [security.txt](https://en.wikipedia.org/wiki/Security.txt) file is a text file that describes a how security researcher can make a responsible disclosure to you. The files is placed in the same location as `robots.txt`, usually the top-level directory.

The [proposed standard](https://securitytxt.org/) consist of 9 fields (2 mandatory, 7 optional). I will implement 7 of them here.

First step is to create a page containing your disclosure policy. It's a policy that outlines all that which a security researcher need to know if they have found or are looking for a vulnerability.

Second, create an acknowledgement page. It's a webpage where you acknowledge the security researchers that have made a responsible disclosure to you. Not everyone might want to be included, but the option should be there for those that do.

Third, place your public PGP-key in an easily accessible location such as the top-level directory. If you have not gotten started with PGP, now is a good time. Proton, the company behind Proton Mail, have a good [article](https://proton.me/blog/what-is-pgp-encryption) on the topic.

You now have everything you need to start populating the fields of your `securty.txt` file. As an example, here are the fields of mine:

```
Expires: 2024-09-01T00:00:00.000Z
Canonical: https://www.stylback.se/security.txt
Policy: https://www.stylback.se/disclose/
Contact: https://www.stylback.se/contact/
Encryption: https://www.stylback.se/key.asc
Preferred-Languages: en, sv
Acknowledgments: https://www.stylback.se/thanks/
```

Next is to sign the contents of the file, this is to ensure that the contents of the file has not been altered and that it's indeed you that authored it. Signing a file will typically compress it into a binary file, as this is not a human-readable format we will instead create a clear signature. The simplest way to do a clear signature is using the `--clear-sign` option for gpg:

```bash
gpg --clear-sign security.txt
```

Which will produce the new file `security.txt.asc`. If you look at its contents you will discover a couple of new fields:

```
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Expires: 2024-09-01T00:00:00.000Z
Canonical: https://www.stylback.se/security.txt
Policy: https://www.stylback.se/disclose/
Contact: https://www.stylback.se/contact/
Encryption: https://www.stylback.se/key.asc
Preferred-Languages: en, sv
Acknowledgments: https://www.stylback.se/thanks/
-----BEGIN PGP SIGNATURE-----

<a bunch of characters>

-----END PGP SIGNATURE-----
```

Now before you copy-paste this into your `security.txt` file you should verify that it matches your PGP key:

```bash
gpg --verify security.txt.asc
```

Which should output:

```bash
gpg: Signature made Thu 03 Aug 2023 11:04:41 CEST
gpg:                using RSA key <a bunch of characters>
gpg: Good signature from "Firstname lastname <name@domain.tld>" [ultimate]
```

If the signature is good, paste the contents into your file and upload the file to your top-level directory.

## Copyright, license and usage

Images, with the exception of the website favicon, is subject to **All Rights Reserved**.

The text content of the Home page is subject to **All Rights Reserved**.

The text contents of posts, which can be found listed on the Blog page, is subject to the [MIT license](https://mit-license.org/).

The following external resources and assets are used in this website and are subject to their own license agreements:

- The website body text font is [Montserrat](https://fonts.google.com/specimen/Montserrat/about), which is licensed under the [Open Font License](https://opensource.org/license/ofl-1-1/).
- The website monospace font is [JetBrains Mono](https://github.com/JetBrains/JetBrainsMono), which is licensed under the [Open Font License](https://github.com/JetBrains/JetBrainsMono/blob/master/OFL.txt).
- The website favicon is "align-left" from [Feathericons](https://feathericons.com/), which is licensed under the [MIT license](https://mit-license.org/).
- The color scheme used for syntax highligthing in dark mode is [Zenburn](https://github.com/jnurmine/Zenburn), which is licensed under [GNU GPL](https://www.gnu.org/licenses/gpl-3.0.html).

The source code of this website, excluding external resources and assets, is subject to the [MIT license](https://mit-license.org/).

If you wish to use assets subject to **All Rights Reserved**, contact me with the following information:

- Your name.
- What assets you would like to use.
- In what capacity you would like to use said assets.
- If the usage capacity is commercial, what legal entity you represent.

I will then get back to you on whether I grant you the right to use said assets or not.