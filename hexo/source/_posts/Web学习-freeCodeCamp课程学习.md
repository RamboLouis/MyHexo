---
title: Web学习-freeCodeCamp课程学习
date: 2018-11-1 10:28:45
categories:
  - Web
tags: 
  - Web
---

## 一、Responsive Web Design Certification(响应式网页设计认证)
### 1. Basic HTML and HTML5(基本的HTML和HTML5)
### 2. Basic CSS（基本CSS）

### 3. Applied Visual Design（应用视觉设计）
* Create Visual Balance Using the text-align Property

> h4标记上的text-align属性将其设置为 center 
p标记上的text-align属性将其设置为 justify

```
h4 {
    text-align: center;
  }
  p {
    text-align: justify;
  }
```

* Adjust the Width of an Element Using the width Property（使用width属性调整元素的宽度）

> 为fullCard类选择器，设置width属性为245px

```
.fullCard {
    width: 245px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin: 10px 5px;
    padding: 4px;
  }
```

* Adjust the Height of an Element Using the height Property（使用height属性调整元素的高度）

> 将height属性添加到h4标记并将其设置为25px

```
h4 {
    text-align: center;
    height: 25px;
  }
```

* Use the strong Tag to Make Text Bold（使用strong标记使文字粗体）

> 在p标签内围绕"Stanford University"包裹一个strong标签。

```
<p>Google was founded by Larry Page and Sergey Brin while they were Ph.D. students at <strong>Stanford University</strong>.</p>
```

* Use the u Tag to Underline Text（使用u标签为文本加下划线）

> 在"Ph.D. students"文本周围包裹u标签

```
<p>Google was founded by Larry Page and Sergey Brin while they were <u>Ph.D. students</u> at <strong>Stanford University</strong>.</p>
```

* Use the em Tag to Italicize Text（使用em标记来显示文本）

> em标签应该环绕p标签的内容

```
<p>  
    <em>
    Google was founded by Larry Page and Sergey Brin while they were <u>Ph.D. students</u> at <strong>Stanford University</strong>.
    </em>
</p>
```

* Use the s Tag to Strikethrough Text（使用s标记删除线文本）

> 将s标签包裹在h4标签内的“Google”周围，然后在其旁边添加单词Alphabet，Alphabet不具有删除线格式。

```
<h4><s>Google</s>Alphabet</h4>
```

* Create a Horizontal Line Using the hr Element（使用hr元素创建水平线）

> 在h4标签下面添加一个hr标签

```
<h4><s>Google</s>Alphabet</h4>
<hr>
```

* Adjust the background-color Property of Text（调整文本的背景颜色属性）

> 将h4元素的背景颜色调整为给定的rgba(45, 45, 45, 0.1)值
删除height属性 并添加 padding 为 10px的填充。 

```
h4 {
    text-align: center;
    padding: 10px;
    background-color: rgba(45, 45, 45, 0.1);
  }
```

* Adjust the Size of a Header Versus a Paragraph Tag（调整标题的大小与段落标记）

> 将字体大小属性添加到设置为27像素的h4元素

```
h4 {
    text-align: center;
    background-color: rgba(45, 45, 45, 0.1);
    padding: 10px;
    font-size: 27px;
  }
```

* Add a box-shadow to a Card-like Element（将盒子阴影添加到类似卡片的元素）

> 把id为thumbnail的元素，使用box-shadow

```
#thumbnail {
    box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
}
```

* Decrease the Opacity of an Element（降低元素的不透明度）

> links的样式设置opacity为0.7

```
.links {
    text-align: left;
    color: black;
    opacity: 0.7;
  }
```

* Use the text-transform Property to Make Text Uppercase（使用text-transform属性使文本为大写）

> 将h4的文本text-transform属性转换为大写

```
h4 {
    text-align: center;
    background-color: rgba(45, 45, 45, 0.1);
    padding: 10px;
    font-size: 27px;
    text-transform: uppercase;
  }
```

* Set the font-size for Multiple Heading Elements（设置多个标题元素的font-size）

> 将h1标记的font-size设置为68px
将h2标记的font-size设置为52px
将h3标签的font-size设置为40px
将h4标记的font-size设置为32px
将h5标记的font-size设置为21px
将h6标记的font-size设置为14px

```
  h1 {
    font-size: 68px;
  }
  h2 {
    font-size: 52px;
  }
  h3 {
    font-size: 40px;
  }
  h4 {
    font-size: 32px;
  }
  h5 {
    font-size: 21px;
  }
  h6 {
    font-size: 14px;
  }
```

* Set the font-weight for Multiple Heading Elements（设置多个标题元素的font-weight）

> 将h1标记的font-weight设置为800
将h2标记的font-weight设置为600
将h3标签的font-weight设置为500
将h4标记的font-weight设置为400
将h5标记的font-weight设置为300
将h6标记的font-weight设置为200

```
  h1 {
    font-size: 68px;
    font-weight: 800;
  }
  h2 {
    font-size: 52px;
    font-weight: 600;
  }
  h3 {
    font-size: 40px;
    font-weight: 500;
  }
  h4 {
    font-size: 32px;
    font-weight: 400;
  }
  h5 {
    font-size: 21px;
    font-weight: 300;
  }
  h6 {
    font-size: 14px;
    font-weight: 200;
  }
```

* Set the font-size of Paragraph Text（设置段落文本的font-size）

> 将段落的font-size属性值更改为16px

```
p {
    font-size: 16px;
  }
```

* Set the line-height of Paragraphs（设置段落的line-height）

> 将line-height属性添加到p标记并将其设置为25px

```
p {
    font-size: 16px;
    line-height: 25px;
  }
```

* Adjust the Hover State of an Anchor Tag（调整锚标记的悬停状态）

> 将a标签设置为黑色。添加规则，当用户将鼠标悬停在a标记上时，颜色为蓝色

```
a {
    color: black;
  }
a:hover {
    color: blue;
  }
```

* Change an Element's Relative Position（更改元素的相对位置）

> 将h2的position更改为relative，并将其移动到距离正常位置top的15px

```
h2 {
    position: relative;
    top: 15px;
}
```

* Move a Relatively Positioned Element with CSS Offsets（）

> 将h2 向右移动15px，向上移动10px

```
h2 {
    position: relative;
    left: 15px;
    bottom: 10px
}
```

* Lock an Element to its Parent with Absolute Positioning（使用Absolute将元素锁定到其父级）

> 给 #searchbar的 top和right元素偏移50px

```
#searchbar {
    position: absolute;
    top: 50px;
    right: 50px;
    
  }
```

* Lock an Element to the Browser Window with Fixed Positioning（使用固定定位将元素锁定到浏览器窗口）

> 将其position更改为fixed，并将其偏离top 0px和left 0px

```
#navbar {
    position: fixed;
    top: 0px;
    left: 0px;
    
    width: 100%;
    background-color: #767676;
  }
```

* Push Elements Left or Right with the float Property（使用float属性向左或向右推送元素）

> 给#left项left设置float，#right项right设置float数。

```
#left {
    float: left;
    width: 50%;
  }
#right {
    float: right;
    width: 40%;
  }
```

*  Change the Position of Overlapping Elements with the z-index Property（使用z-index属性更改重叠元素的位置）

> first的元素的z-index值应为2

```
  .first {
    background-color: red;
    position: absolute;
    z-index: 2;
  }
```

* Center an Element Horizontally Using the margin Property（使用margin属性水平居中元素）

> 通过添加值为auto的margin属性将页面居中放在页面上

```
div {
    background-color: blue;
    height: 100px;
    width: 100px;
    margin: auto;
  }
```

* Learn about Complementary Colors（了解互补色）

> blue类的div元素应具有blue的background-color
yellow类的div元素应具有yellow的background-color

```
.blue {
    background-color: blue;
  }
.yellow {
    background-color: yellow;
  }
```

* Learn about Tertiary Colors（了解第三色）

> 将orange，cyan和raspberry的background-color属性更改为各自的颜色,确保使用十六进制代码

```
.orange {
    background-color: #FF7D00;
  }
  
.cyan {
    background-color: #00FFFF;
  }
  
.raspberry {
    background-color: #FF007D;
  }
```

* Adjust the Color of Various Elements to Complementary Colors（将各种元素的颜色调整为互补色）

> header元素的background-color应为＃09A7A1
footer元素的background-color应为＃09A7A1
h2元素的color应为＃09A7A1
button元素的background-color应为＃FF790E。

```
header {
    background-color: #09A7A1;
    color: white;
    padding: 0.25em;
  }
footer {
    background-color: #09A7A1;
    color: white;
    padding: 0.5em;
  }
h2 {
    color: #09A7A1;
  }  
button {
    background-color: #FF790E;
  }
```

* Adjust the Hue of a Color（调整颜色的色调）

> 使用hsl()根据类名（green, cyan, 或blue）更改每个div元素的背景颜色

```
.green {
    background-color: hsl(120, 100%, 50%);
  }
.cyan {
    background-color: hsl(180, 100%, 50%);
  }
.blue {
    background-color: hsl(240, 100%, 50%);
  }
```

* Adjust the Tone of a Color（调整颜色的色调）

> 为nav元素添加背景颜色，使其使用相同的青色色调，但具有80％饱和度和25％亮度值，以改变其色调和阴影

```
nav {
    background-color: hsl(180, 80%, 25%);
  }
```

* Create a Gradual CSS Linear Gradient（创建渐进的CSS线性渐变）

> 对div元素的background使用linear-gradient(），并从35deg的方向设置它以将颜色从#CCFFFF更改为#FFCCCC

```
div{ 
    border-radius: 20px;
    width: 70%;
    height: 400px;
    margin: 50px auto;
    background: linear-gradient(35deg, #CCFFFF, #FFCCCC);
  }
```

* Use a CSS Linear Gradient to Create a Striped Element（使用CSS线性渐变来创建条带元素）

> 通过更改repeating-linear-gradient()以使用45deg的渐变角度来创建条纹，然后将前两个颜色设置为yellow，将最后两个颜色设置为black

```
div{ 
    border-radius: 20px;
    width: 70%;
    height: 400px;
    margin:  50 auto;
    background: repeating-linear-gradient(
      45deg,
      yellow 0px,
      yellow 40px,
      black 40px,
      black 80px
    );
  }
```

* Create Texture by Adding a Subtle Pattern as a Background Image（通过添加细微图案作为背景图像来创建纹理）

> 使用https://i.imgur.com/MJAkxbh.png的网址，使用正文选择器设置整个页面的背景

```
<style>
  body {
    background: url(https://i.imgur.com/MJAkxbh.png);
  }
</style>
```

* Use the CSS Transform scale Property to Change the Size of an Element（使用CSS Transform scale属性更改元素的大小）

> id为#ball2的元素大小增加到原始大小的1.5倍


```
#ball2 {
    left: 65%;
    transform: scale(1.5);
  }
```

* Use the CSS Transform scale Property to Scale an Element on Hover（使用CSS Transform scale属性在悬停上缩放元素）

> 为div的悬停状态添加CSS规则，当用户将鼠标悬停在其上时, 使用transform属性将div元素缩放到其原始大小的1.1倍


```
div:hover {
    transform: scale(1.1);
  }
```

* Use the CSS Transform Property skewX to Skew an Element Along the X-Axis（使用CSS变换属性skewX, 沿X轴倾斜元素）

> 使用transform属性,将id为bottom的元素沿X轴倾斜24deg

```
#bottom {
    background-color: blue;
    transform: skewX(24deg);
  }
```

* Use the CSS Transform Property skewY to Skew an Element Along the Y-Axis（使用CSS变换属性skewY，沿Y轴倾斜元素）

> 使用transform属性，将id为top的元素沿Y轴倾斜-10deg

```
#top {
    background-color: red;
    transform: skewY(-10deg);
  }
```

* Create a Graphic Using CSS（使用CSS创建图形）

> 将background-color更改为transparent
将border-radius属性设置为50％以形成圆形
更改box-shadow属性，将offset-x设置为25px，offset-y设置为10px，blur-radius设置为0，spread-radius设置为0，颜色设置为blue

```
.center {
  position: absolute;
  margin: auto;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  width: 100px;
  height: 100px;
  
  background-color: transparent;
  border-radius: 50%;
  box-shadow: 25px 10px 0px 0px blue; 
}
```

* Create a More Complex Shape Using CSS and HTML（使用CSS和HTML创建更复杂的形状）

> 在heart::after选择器中，将background-color更改为pink，将border-radius更改为50％
在heart选择器中，填写transform属性，使用rotate()函数偏转-45deg
在heart::before选择器中，将其content属性设置为空字符串

```
.heart {
  transform: rotate(-45deg);
}
.heart::after {
  background-color: pink;
  border-radius: 50%;
  }
.heart::before {
  content: "";
}
```

* Learn How the CSS @keyframes and animation Properties Work（了解CSS @keyframes和动画属性的工作原理）

> 为id为rect的元素创建动画，animation-name设置为rainbow，并将animation-duration设置为4s
声明一个@keyframes规则，并将动画开头的背景颜色（0％）设置为blue，将动画的中间（50％）设置为green，将动画的结尾（100％）设置为yellow

```

  #rect {
    animation-name: rainbow;
    animation-duration: 4s;
  }
  @keyframes rainbow {
    0% {
      background-color: blue;
    }
    50% {
      background-color: green;
    }
    100% {
      background-color: yellow;
    }
  }
```

* Use CSS Animation to Change the Hover State of a Button（使用CSS动画更改按钮的悬停状态）

> 使用@keyframes规则将动画名称为background-color的background-color在100％的时候更改为#4791d0

```
 @keyframes background-color {
    100% {
      background-color: #4791d0;
    }
  }
```

* Modify Fill Mode of an Animation（修改动画的填充模式）

ps：因为动画在500ms过后会重置，导致按钮恢复为原始颜色，这样做会将按钮保持突出显示
> button：hover应该具有值为forward的animation-fill-mode属性

```
  button:hover {
    animation-name: background-color;
    animation-duration: 500ms;
    animation-fill-mode: forwards;
  }
```

* Create Movement Using CSS Animation（使用CSS动画创建运动）

> @keyframes规则0％的时候,向left偏移0px
@keyframes规则50％的时候,向left偏移25px
@keyframes规则100％的时候,向left偏移-25px

```
@keyframes rainbow {
  0% {
    background-color: blue;
    top: 0px;
    left: 0;
  }
  50% {
    background-color: green;
    top: 50px;
    left: 25px;
  }
  100% {
    background-color: yellow;
    top: 0px;
    left: -25px;
  }
}
```

* Create Visual Direction by Fading an Element from Left to Right（通过从左到右淡化元素来创建视觉方向）

> @keyframes规则用于淡入淡出50％的时候, 将opacity属性设置为0.1

```
@keyframes fade {
    50% {
      left: 60%;
      opacity: 0.1;
    }
  }
```

* Animate Elements Continually Using an Infinite Animation Count（动画元素不断使用无限动画计数）

> 要使球在连续循环中保持在右侧弹跳，请将animation-iteration-count属性更改为infinite值

```
  #ball {
    animation-iteration-count: infinite;
  }
```

* Make a CSS Heartbeat using an Infinite Animation Count
（使用无限动画计数制作CSS心跳）

> heart类的animation-iteration-count属性应具有infinite值
back类的animation-iteration-count属性应具有infinite值。

```
  .back {
    animation-iteration-count: infinite;
  }
  .heart {
    animation-iteration-count: infinite
  }
```

* Animate Elements at Variable Rates（可变速率动画元素）

> 将star-1类的@keyframes规则改为50％

```
  @keyframes twinkle-1 {
    50% {
      transform: scale(0.5);
      opacity: 0.5;
    }
  }
```

* Animate Multiple Elements at Variable Rates（可变速率动画多个元素）
之前可以通过更改其@keyframes规则来更改两个相似动画元素的动画速率。也可以通过操纵多个元素的动画持续时间来实现相同的目标。 

> star-1的星的animation-duration属性应为1s
star-2的星的animation-duration属性应为0.9s
star-3的星的animation-duration属性应为1.1s

```
.star-1 {
    margin-top: 15%; 
    margin-left: 60%;
    animation-duration: 1s;
    animation-name: twinkle;
  }

  .star-2 {
    margin-top: 25%;
    margin-left: 25%;
    animation-duration: 0.9s;
    animation-name: twinkle;
  }

  .star-3 {
    margin-top: 10%;
    margin-left: 50%;
    animation-duration: 1.1s;
    animation-name: twinkle;
  }
```

* Change Animation Timing with Keywords（使用关键字更改动画计时）

> id为ball1的元素的animation-timing-function属性的值应该是linear
id为ball2的元素的animation-timing-function属性的值是ease-out

```
#ball1 { 
    left:27%;
    animation-timing-function: linear;
  }
#ball2 { 
    left:56%;
    animation-timing-function: ease-out;
  }
```

* Learn How Bezier Curves Work（了解Bezier曲线的工作原理）

> id为ball1的元素，将animation-timing-function属性的值从linear更改为其等效的cubic-bezier函数值

```
 #ball1 { 
    left: 27%;
    animation-timing-function: cubic-bezier(0.25, 0.25, 0.75, 0.75);
  }
```

* Use a Bezier Curve to Move a Graphic（使用贝塞尔曲线移动图形）

> 将id为red的元素的animation-timing-function更改为cubic-bezier函数，其中x1，y1，x2，y2值分别设置为0,0,0.58,1

```

```

* Make Motion More Natural Using a Bezier Curve（使用贝塞尔曲线使运动更自然）

> id为green的元素的animation-timing-function的值更改为cubic-bezier函数，x1，y1，x2，y2值分别设置为0.311,0.441,0.444,1.649

```
#green {
    background: green;
    left: 75%;
    animation-timing-function: cubic-bezier(0.311, 0.441, 0.444, 1.649);
  }
```

### 4. Applied Accessibility（应用可访问性）


