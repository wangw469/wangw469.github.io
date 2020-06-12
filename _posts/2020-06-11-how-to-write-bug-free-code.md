---
layout: post
title: 如何写出没有bug的代码？
---

{{ page.title }}
================
<p class="meta">11 June 2020 - Soochow</p>

去年的某个时间，我在hacker news上看到了nocode项目：

<blockquote class="quoteback" data-title="kelseyhightower/nocode" data-author="@github" cite="https://github.com/kelseyhightower/nocode">
The best way to write secure and reliable applications. Write nothing; deploy nowhere.
<footer>@github <cite><a href="https://github.com/kelseyhightower/nocode">https://github.com/kelseyhightower/nocode</a></cite></footer>
</blockquote>
<script note="" src="https://cdn.jsdelivr.net/gh/Blogger-Peer-Review/quotebacks@1/quoteback.js"></script>

这看起来行为艺术的做法，再次强化了我的观点：没有写出来的代码没有bug。

话再说下去，就要有点禅的味道了。

随着需求的增加，软件变得越来越复杂，直到复杂度超出人力可控范围，便是项目在技术上的崩溃。

如何少写或者不写代码实现特性，是管理复杂度最自然的思路。

至少有以下方法可以做到：
1. 不实现特性（不做会怎么样？）
2. 借助第三方（开源软件，操作系统机制）
3. 使用表达力更强的语言
4. 追求实现特性的最小改动集合
