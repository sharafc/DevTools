# CSS Tricks

## Console magic

### Get a list of all CSS classes used in a document:

    [...new Set($$("[class]").flatMap(e => [...e.classList]))]

### Get a list of all used elements in a document:

    [...new Set($$("*").map(e => e.nodeName.toLowerCase()))]

Use `***` for elements inside `<head>` and `<body>` or `body *` for elements inside `<body>` only
