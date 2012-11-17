class Html5slides2pdf
  TEMPLATE =<<-EOS
<!doctype html>
<head>
<meta charset="UTF-8">
<style>
body {
  font-family: 'Open Sans', Arial, sans-serif;
  font-size: 26px;
  line-height: 36px;
}
article {
  display: block;
  width: 900px;
  height: 670px;
  padding: 40px 60px;
  margin: 10px;
  /*border: 1px solid rgba(0, 0, 0, .3);*/
  border-radius: 10px;
}
b {
  font-weight: 600;
}
a {
  color: rgb(0, 102, 204);
}
a:hover {
  color: black;
}
p {
  margin: 0;
  padding: 0;
  margin-top: 20px;
}
h1 {
  font-size: 60px;
  line-height: 60px;
  padding: 0;
  margin: 0;
  margin-top: 200px;
  padding-right: 40px;
  font-weight: 600;
/*  letter-spacing: -3px;*/
  color: rgb(51, 51, 51);
}
h2 {
  font-size: 45px;
  line-height: 45px;
  padding: 0;
  margin: 0;
  padding-right: 40px;
  font-weight: 600;
/*  letter-spacing: -2px;*/
  color: rgb(51, 51, 51);
}
h3 {
  font-size: 30px;
  line-height: 36px;
  padding: 0;
  margin: 0;
  padding-right: 40px;
  font-weight: 600;
/*  letter-spacing: -1px;*/
  color: rgb(51, 51, 51);
}
ul {
  margin: 0;
  padding: 0;
  margin-top: 20px;
  margin-left: 1.5em;
}
li {
  padding: 0;
  margin: 0 0 .5em 0;
}
div.code {
  padding: 5px 10px;
  margin-top: 20px;
  margin-bottom: 20px;
  overflow: hidden;
  background: rgb(240, 240, 240);
  border: 1px solid rgb(224, 224, 224);
}
pre {
  margin: 0;
  padding: 0;
  font-family: 'Droid Sans Mono', 'Courier New', monospace;
  font-size: 18px;
  line-height: 24px;
  /*letter-spacing: -1px;*/
  color: black;
}
code {
  font-size: 95%%;
  font-family: 'Droid Sans Mono', 'Courier New', monospace;
  color: black;
}
image {
  text-align: center;
  margin-top: 40px;
}
.presenter {
        margin-top: 20px;
}
.presenter p,
.presenter .link {
        margin: 0;
        font-size: 28px;
        line-height: 1.2em;
}
</style>
</head>
<body>
%<article>s
</body>
</html>
  EOS
end

