Your content can be displayed to users on data.world in two different ways:

1. As files
2. As embeds

## Content Files

data.world is not limited in terms of which file types can be uploaded and processed (e.g. CSV,
Excel, Json, etc).

You can and should promote the upload of any content that gives context to the data and aids
reproducibility (e.g. images, interactive html documents, notebooks, scripts, etc).

Our [growing list of supported file formats](https://help.data.world/hc/en-us/articles/115005845327-What-file-types-can-I-upload-)
includes: jpg, jpeg, png, gif, svg, pdf, md, txt, ipynb (version 4 and higher), js, r, py, as, apl,
bash, bas, bat, c, cpp, cs, css, d, dart, diff, go, html, ini, java, julia, kt, lua, matlab, nasm,
ml, perl, php, ps1, rb, scala, sql, tcl, ts, vim, yaml, xml, asp, jade, tex, less, sass, scss,
Dockerfile.

As needed and possible, we'll display a rich preview and/or source code when users access the file on data.world. For example:

!["D3 Visualization"](https://cdn.filepicker.io/api/file/0YRIz35IQMOBucnsFacl "D3 Visualization")

## Content Embeds

Rich embeds can be included in any markdown document (e.g. dataset summary, data project objective,
insights, discussions, etc) by simply wrapping a URL in `@()`, for example
`@(https://public.tableau.com/shared/2B5N9Z8KN?:display_count=yes)`.

!["Tableau Embed"](https://cdn.filepicker.io/api/file/viOaoJe7QgoItUtgeDmA "Tableau Embed")

data.world leverages [oEmbed](https://oembed.com/) to make that possible. oEmbed is format for
allowing an embedded representation of a URL on third party sites.

Upon implementing the oEmbed protocol, [contact our support team](https://help.data.world/hc/en-us/requests/new) so that we can test 
your implementation and whitelist your website. At that point, getting your content on data.world
in rich and interactive form becomes as easy as copying and pasting a URL!
